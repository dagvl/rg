
require 'spec'

ROOT = File.join(File.dirname(__FILE__), '..', '..')
Dir.glob(File.join(ROOT, 'src', '**', '*.rb')).each do |f| 
  #puts f
  require f
end


Given /^a map of size (.*),(.*)$/ do |x, y|
  @map = RG::Area.new(x.to_i, y.to_i)
end

Then /^the x-size should be (.*)$/ do |size|
  @map.x_size == size.to_i
end

Then /^the y-size should be (.*)$/ do |size|
  @map.x_size == size.to_i
end

Then /^all tiles should be nil$/ do
  0.upto(@map.x_size-1) do |x|
    0.upto(@map.y_size-1) do |y|
      @map[x,y].should == nil
    end
  end
end
