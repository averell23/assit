module Assit
  
  # Error class for the asserts
  class AssertionFailure < StandardError
  end
  
  # Raises an error if the assertion fails
  class RaiseAction
    
    # The action
    def assert_it(message)
      raise AssertionFailure.new("ASSIT FAILED: #{message}")
    end
  end
  
end
