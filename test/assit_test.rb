# Set up
ENV['ASSIT_ACTION'] = 'raise'

require 'rubygems'
require 'test/unit'
require File.dirname(__FILE__) + "/../lib/assit"

if(File.exists?(File.dirname(__FILE__) + '/tesly_reporter.rb'))
  printf("Continuing with tesly\n")
  require File.dirname(__FILE__) + '/tesly_reporter'
end

# Test the simple assert facility
class AssitTest < Test::Unit::TestCase
  
  # Tests the basic assert facility
  def test_assert
    assit(true)
    assert_raise(Assit::AssertionFailure) { assit(false, "boing") }
  end
  
  # Test nil assert
  def test_assert_not_nil
    not_nil = "xxx"
    assit_not_nil(not_nil, "message")
    assert_raise(Assit::AssertionFailure) { assit_not_nil(nil) }
  end
  
  # Test type assert
  def test_assert_type
    my_string = String.new
    my_hash = Hash.new
    
    assit_type(my_string, Object)
    assit_type(my_string, String, "message")
    assert_raise(Assit::AssertionFailure) { assit_type(my_hash, String, "message") }
  end
  
  # Test equality assert
  def test_assert_equal
    assit_equal(1, 1)
    assert_raise(Assit::AssertionFailure) { assit_equal(0, 1) }
  end
  
end
