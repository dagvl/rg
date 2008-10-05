# Just for testing that curses work etc..

require 'rubygems'

%w(ncurses).each do |g|
  gem g
  require g
end

#fix load path
ROOT = File.join(File.dirname(__FILE__), '..')
LIBPATH = File.join(ROOT, 'src')

#print LIBPATH

$LOAD_PATH << LIBPATH

#puts $LOAD_PATH

#require RG classes

Dir.glob('src/**/*.rb').each do |f| 
  puts "Loading #{f}"
  require f
end


demo = RG::UI::Demo.new
demo.run

