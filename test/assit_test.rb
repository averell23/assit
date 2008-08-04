# Set up
ENV['ASSIT_ACTION'] = 'raise'

require 'rubygems'
require 'test/unit'
require File.dirname(__FILE__) + "/../lib/assit"

if(File.exists?(File.dirname(__FILE__) + '/tesly_reporter.rb'))
  printf("Continuing with tesly\n")
  require File.dirname(__FILE__) + '/tesly_reporter'
end

# Helper class for the duck typing assertion
class QuackClass
  def quack
  end
  
  def moo
  end
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
  def test_assert_kind_of
    my_string = String.new
    my_hash = Hash.new
    
    assit_kind_of(Object, my_string)
    assit_kind_of(String, my_string, "message")
    assert_raise(Assit::AssertionFailure) { assit_kind_of(String, my_hash, "message") }
  end
  
  # Test equality assert
  def test_assert_equal
    assit_equal(1, 1)
    assert_raise(Assit::AssertionFailure) { assit_equal(0, 1) }
  end
  
  # Test fail 
  def test_assert_fail
    assert_raise(Assit::AssertionFailure) { assit_fail }
  end
  
  # Test the duck typing assertions
  def test_assert_quack
    object_duck = QuackClass.new
    assit_quack(object_duck, :quack)
    assit_quack(object_duck, [:quack, :moo])
    assit_quack(object_duck, :moo, "test")
    assert_raise(Assit::AssertionFailure) { assit_quack(object_duck, :growl) }
  end
  
  # Test the block assertion
  def test_assert_block
    assit_block { true }
  end
  
  # Test the block assertions failure
  def test_assert_block_fail
    assert_raise(Assit::AssertionFailure) { assit_block { 'foo' == 'bar' } }
  end
  
  # Test the block assertions failure
  def test_assert_block_fail_implicit
    assert_raise(Assit::AssertionFailure) { assit_block { |err| err << 'failed' } }
  end
  # Test block assertion error messages
  def test_asser_block_message
    assert_raise(Assit::AssertionFailure) do
      begin
        assit_block { |errors| errors << 'message'; false }
      rescue Assit::AssertionFailure => e
        assert('message', e.message)
        raise
      end
    end
  end
  
end
