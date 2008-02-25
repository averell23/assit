require 'ruby-debug'
Debugger.start

module Assit
  
  # Error class for the asserts
  class AssertionFailure < StandardError
  end
  
  # Raises an error if the assertion fails
  class DebugAction
    
    # The action
    def assert_it(message)
      debugger
    end
  end
  
end
