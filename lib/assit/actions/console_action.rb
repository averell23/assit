module Assit
  
  # Prints to stderr if the assertion fails
  class ConsoleAction
    
    # The action
    def assert_it(message)
      $stderr.puts("Assertion failed: " + message.to_s)
      $stderr.puts("at: ")
      caller.each { |trace| $stderr.puts trace }
    end
  end
  
end
