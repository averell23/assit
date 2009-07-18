# Loads the Assit framework and configures it
require 'assit_config.rb'

# Do the configuration
AssitConfig::do_config!

if(AssitConfig.disabled?)
  require 'disable_assertions'
else
  require 'setup_assertions'
end