require 'rubygems'
require 'test/unit'
require File.dirname(__FILE__) + "/../lib/simpleassert"

if(File.exists?(File.dirname(__FILE__) + '/tesly_reporter.rb'))
  printf("Continuing with tesly\n")
  require File.dirname(__FILE__) + '/tesly_reporter'
end

# Test the simple assert facility
class SimpleAssertTest < Test::Unit::TestCase
  def setup
    @@debug_old = $DEBUG # save the debug mode
    $DEBUG = true
  end
  
  def teardown
    $DEBUG = @@debug_old
  end
  
  # Tests the basic assert facility
  def test_assert
    sassert(true)
    assert_raise(AssertionFailure) { sassert(false, "boing") }
    $DEBUG = false
    sassert(false)
  end
  
  # Test nil assert
  def test_assert_not_nil
    not_nil = "xxx"
    sassert_not_nil(not_nil, "message")
    assert_raise(AssertionFailure) { sassert_not_nil(nil) }
  end
  
  # Test type assert
  def test_assert_type
    my_string = String.new
    my_hash = Hash.new
    
    sassert_type(my_string, Object)
    sassert_type(my_string, String, "message")
    assert_raise(AssertionFailure) { sassert_type(my_hash, String, "message") }
  end
  
  # Test equality assert
  def test_assert_equal
    sassert_equal(1, 1)
    assert_raise(AssertionFailure) { sassert_equal(0, 1) }
  end
  
end
