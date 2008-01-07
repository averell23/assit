# Loads the Assit framework and configures it
require 'config.rb'

# Do the configuration
Assit::Config::do_config!

if(Assit::Config.disabled?)
  require 'disable_assertions'
else
  require 'setup_assertions'
end