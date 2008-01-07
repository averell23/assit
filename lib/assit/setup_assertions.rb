# This sets up the assertions to be used

class Object
  
  # The main assertion method
  def assit(bool, message = "Assertion failed.")
    unless(bool)
      Assit::Config::action.assert_it(message)
    end
  end
  
  # Include the assertions
  include Assit::Assertions
  
end
