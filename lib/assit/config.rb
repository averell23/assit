module Assit
  
  # Helper module for the configuration
  # Ths is used to load the Assit module. The following configuration 
  # options exist: 
  # 
  # * assit_disabled - If set it will completely disable the assertions
  # * assit_action  - Selects the action that will be executed if the assert fails
  #
  # The Assit framework can be configured through environment variables or
  # a config file (assit_config.rb) in the current load path. 
  #
  # If environment variables are used, the should have ALL UPPERCASE
  # names, as ASSIT_DISABLED and ASSIT_ACTION.
  #
  # Environment variables take precedence over the config file.
  #
  # If no configuration is given, the module is configured 
  # automatically:
  #
  # A Rails installation run in 'production' mode will have the
  # assertions disabled.
  #
  # A Rails installation in the other modes will use :raise as
  # the default action.
  #
  # Other scripts will use :raise if the $DEBUG flag is set, otherwise
  # :log is used as the default action
  module Config
  
    # defines the methods used for the config file
    
    # Sets the "disable" flag
    def self.assit_disabled(disable)
      @assit_disabled = disable
      @assit_disabled_conf = true
    end

    # Gets the "disable" flag
    def self.disabled?
      @assit_disabled
    end

    # Get the action for failed assertions
    def self.action
      @@assit_action_object ||= begin
        action_name = "#{@assit_action.to_s.downcase}_action"

        # require the action's file
        require File.join('actions', action_name)

        # Get the class of the widget and check, just to be sure
        klass = Assit.const_get(camelize(action_name))
        raise(RuntimeError, "Action class does not exist") unless(klass.is_a?(Class))

        # Create the new widget
        klass.new()
      end
    end

    # Sets the action for failed assertions. This will
    # create the AssitAction object that can be used by the
    # framework
    def self.assit_action(action)
      @assit_action = action.to_sym
    end

    # Sets up the Assit configuration parameters
    def self.do_config!
      # Try to load the configuration
      begin
        require 'assit_config'
      rescue LoadError
        # Fail silently, we don't care if there is no config file
      end

      # Check for the environment variables. They can overwrite the 
      # config file variables.
      @assit_disabled ||= ENV['ASSIT_DISABLED'] && (ENV['ASSIT_DISABLED'].downcase == 'true' || ENV['ASSIT_DISABLED'].downcase == 'yes') 
      @assit_disabled_conf ||= (ENV['ASSIT_DISABLED'] != nil)
      @assit_action ||= ENV['ASSIT_ACTION'] ? ENV['ASSIT_ACTION'].downcase.to_sym : nil

      # If still not configured, use the auto-config
      @assit_disabled ||= auto_disable unless(@assit_disabled_conf)
      @assit_action ||= auto_action
      
      # Call the action one time to create and load it
      action
      
      # return true
      true
    end
    
    protected 
    
    # Used to auto-configure the action
    def self.auto_action
      # Raise if the debug mode is set or rails is in test or development
      if($DEBUG || (ENV['RAILS_ENV'] && ENV['RAILS_ENV'] != 'production'))
        :raise
      else
        :console
      end
    end

    # Used to auto-configure the "disable" flag
    def self.auto_disable
      # In Rails production we auto-disable
      (ENV['RAILS_ENV'] && ENV['RAILS_ENV'] == 'production')
    end

   # Stolen from Rails ;-)
   def self.camelize(lower_case_and_underscored_word, first_letter_in_uppercase = true)
     if first_letter_in_uppercase
       lower_case_and_underscored_word.to_s.gsub(/\/(.?)/) { "::" + $1.upcase }.gsub(/(^|_)(.)/) { $2.upcase }
     else
       lower_case_and_underscored_word.first + camelize(lower_case_and_underscored_word)[1..-1]
     end
   end
  
  end  
end
