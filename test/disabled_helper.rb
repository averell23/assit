# Helper test for the 'disabled' mode. This must be run separate
# from the main tests

# Set up
ENV['ASSIT_ACTION'] = 'raise'
ENV['ASSIT_DISABLED'] = 'yes'

require 'rubygems'
require 'test/unit'
require File.dirname(__FILE__) + "/../lib/assit"

class DisabledTest < Test::Unit::TestCase
  
  # Test the assit method itself
  def test_assert
    assert_nil(assit(true))
    assert_nil(assit(false))
  end
  
  # Test if the aliases were built correctly
  def test_assert
    assit_kind_of(1, 1)
    assert_nil(assit_kind_of(true))
    assert_nil(assit_kind_of(false))
  end
end
