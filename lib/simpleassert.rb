=begin
  This adds simple assert() functionality to the object class. It can be
  packagd into it's own gem and extended later.
  
  We call the functions "sassert*" to differentiate them from the unit
  test asserts.
  
  At the moment, it just raises an error in debug mode, and is ignored
  otherwise
=end

# Error class for the asserts
class AssertionFailure < StandardError
end

# Add the functionality to the objects
class Object
  
  # Standard assert
  def sassert(bool, message = "Assertion failed")
    if(debug)
      if(!bool)
        raise AssertionFailure.new("ASSERT: #{message}")
      end
    else
      if(!bool)
        $stderr.puts("Assertion failed: " + message.to_s)
        $stderr.puts("at: " + caller.to_s)
      end
    end
  end
  
  # Assert if an object is not nil
  def sassert_not_nil(object, message = "Object is nil")
    sassert(object != nil, message)
  end
  
  # Assert if two objects are equal
  def sassert_equal(expected, actual, message = "Object expected to be equal")
    if(expected != actual)
      message += " expected #{expected} but was #{actual}"
      sassert(false, message)
    end
  end
  
  # Assert if something is of the right type
  def sassert_type(object, klass, message = "Object of wrong type")
    if(!object.kind_of?(klass))
      message += " expected #{klass} but was #{object.class}"
      sassert(false, message)
    end
  end
  
  protected 
  
  def debug
    # Little tricky, because we cant use ||= to assign a value of 'false' only
    # one time
    @@debug_defined ||= defined?(@debug)
    unless(@@debug_defined)
      @@debug = $DEBUG || (ENV['RAILS_ENV'] && ENV['RAILS_ENV'] != 'production')
    end
    @@debug
  end
end
