# This disables all assertions by providing a "nop" operation for each
# assertion that is defined
class Object
  
  # The base assertion is the NOP 
  def assit(*params, &block) # :nodoc:
  end
  
  # Now create an alias for each assertion
  Assit::Assertions.instance_methods.each do |assertion_method|
    # Check if this is an assert method, if yes create alias
    if(assertion_method =~ /assit_.*/)
      alias_method assertion_method.to_s, :assit
    end
  end
  
end
