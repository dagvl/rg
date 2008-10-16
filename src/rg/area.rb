module RG
  class Area
    #I am a area. An area is the thing the mobiles walk around on
  
    def initialize(size_x, size_y)
      @map = []
      @size_x = size_x
      @size_y = size_y
      
      size_x.times do
        row = []
        size_y.times do
          row << nil
        end
        @map << row
      end
    end
  end
end
