module Assit
  
  # Contains the assertion methods for the framework
  module Assertions

    # Assert if an object is not nil
    def assit_not_nil(object, message = "Object is nil")
      assit(object != nil, message)
    end

    # Assert if two objects are equal
    def assit_equal(expected, actual, message = "Object expected to be equal")
      if(expected != actual)
        message += " expected #{expected} but was #{actual}"
        assit(false, message)
      end
    end

    # Assert if something is of the right type
    def assit_type(object, klass, message = "Object of wrong type")
      if(!object.kind_of?(klass))
        message += " expected #{klass} but was #{object.class}"
        assit(false, message)
      end
    end
    
  end
end
