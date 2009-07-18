=begin
  This adds simple assert() functionality to the object class. It can be
  packagd into it's own gem and extended later.
  
  We call the functions "assit_*" to differentiate them from the unit
  test asserts.


=end

$: << File.expand_path(File.join(File.dirname(__FILE__), 'assit'))

require 'assertions.rb'
require 'loader.rb'