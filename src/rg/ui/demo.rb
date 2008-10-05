module RG
  module UI
    class Demo
      # I just test curses functionality
      def initialize
        @char = '@'
        @x, @y = 10, 10
      end
      
      def run
        init_screen()
        
        #handler on CTRL-C
        trap "INT" do
          end_curses()
          exit
        end
        
        loop do
          oldx, oldy = @x, @y
          ch = Ncurses.getch()
          case ch          
          when Ncurses::KEY_UP
            @y -= 1
          when Ncurses::KEY_LEFT
            @x -= 1
          when Ncurses::KEY_DOWN
            @y += 1
          when Ncurses::KEY_RIGHT
            @x += 1
          when 'q'.to_i
            end_curses()
            exit
          end
          
          Ncurses.mvprintw(oldy, oldx, ' ')
          Ncurses.mvprintw(@y, @x, @char)
          Ncurses.refresh()
        end
      rescue Exception => e
        end_curses
        raise e
      end
      
      def init_screen
        #initialization stuff
        Ncurses.initscr()                    #init screen
        Ncurses.noecho()                     #don't echo input
        Ncurses.keypad(Ncurses.stdscr, true) #read special chars
        Ncurses.refresh()                    #clear
      end
      
      def end_curses
        Ncurses.endwin()
      end
      
    end
  end
end
