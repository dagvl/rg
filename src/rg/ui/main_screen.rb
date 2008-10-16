module RG::UI
  class MainScreen
    # I am the main interface. I handle input and output
    
    include NcursesUI
    
    def run
      @exit_game = false
      
      #sensible exit on CTRL-C
      trap "INT" do
        end_ncurses()
        exit
      end
      
      start_ncurses()
      
      begin
        input_loop()
      rescue Exception => e
        #Exit ncurses mode before printing stacktrace
        end_ncurses()
        raise e
      end
      
      end_ncurses()
    end
    
    
    private
    def input_loop()
      #I am the main game loop
      while !@exit_game do
        input = Ncurses.getch()
        handle_input(input)
        tick()
        update_screen()
      end
    end
    
    def handle_input(key)
      
    end
    
    def update_screen()
    end
    
    def tick()
      #I advance the game multiple ticks until something either needs input or output
    end
  end
end