# Just for testing that curses work etc..

require 'rubygems'

%w(ncurses).each do |g|
  gem g
  require g
end

%w(logger).each do |l|
  require l
end

#fix load path
ROOT = File.join(File.dirname(__FILE__), '..')
LIBPATH = File.join(ROOT, 'src')
$LOAD_PATH << LIBPATH

#logging
LOGDIR = File.join(ROOT, 'log')
module RG
    LOG = Logger.new(File.join(LOGDIR, "debug.log"))
    LOG.level = Logger::DEBUG
end


#require RG classes
RG::LOG.info "Loading classes"
Dir.glob('src/**/*.rb').each do |f| 
  RG::LOG.debug "Loading #{f}"
  require f
end

game = RG::UI::MainScreen.new
game.run