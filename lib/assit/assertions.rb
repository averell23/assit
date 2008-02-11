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
    def assit_kind_of(klass, object, message = "Object of wrong type")
      if(!object.kind_of?(klass))
        message += " (Expected #{klass} but was #{object.class})"
        assit(false, message)
      end
    end
    
    # Fails the assertion
    def assit_fail(message = "Assertion with assit_fail")
      assit(false, message)
    end
    
    # Duck typing assertion: This checks if the given object responds to the
    # given method calls. This won't detect any calls that will be handled
    # through method_missing, of course.
    #
    # Methods can be a single method name, or an Enumerable with multiple names
    def assit_quack(object, methods, message = "Quack assert failed.")
      unless(methods.kind_of?(Enumerable))
        methods = [methods]
      end
      
      methods.each do |method|
        unless(object.respond_to?(method.to_sym))
          assit(false, "#{message} - Method: #{method.to_s}")
        end
      end
    end
    
    # Asserts that the given element is a string that is not nil and not an
    # empty string, or a string only containing whitspaces
    def assit_real_string(object, message = "Not a non-empty string.")
      unless(object && object.kind_of?(String) && object.strip != "")
        assit(false, message)
      end
    end
    
    # Executes the given block and asserts if the result is true. This allows
    # you to assert on complex, custom expressions and be able to disable
    # those expressions together with the assertions. See the README for more.
    def assit_block(message = "Assertion failed.", &block)
      assit(block.call, message)
    end 
    
  end
end
