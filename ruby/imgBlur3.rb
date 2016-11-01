class Image
  attr_accessor :img

  def initialize(img)
    self.img = img
  end

  def output
    #display matrix
    self.img.each {|row| puts row.join("  ")}
  end

  def find_ones
    #initialize array to store ones
    ones = []

    #find ones
    self.img.each_with_index do |row, row_index|
      row.each_with_index {|cell, cell_index| ones << [row_index,cell_index] unless cell != 1 }
    end

    #display results
    case ones.size
      when 0
        puts "There were no ones found."
      when 1
        puts "There was a single one, found at #{ones}."
      else
        puts "There were #{ones.size} ones, found at #{ones}."
    end

    ones
  end

  def blur(distance = 1)
    #prepare blur
    ones = find_ones
    puts "Applying #{distance} pixel image blur..."

    #define img dimensions
    width = self.img[0].size
    height = self.img.size

    #apply blur to each ones instance
    ones.each do |row,column|

      #set adjacent elements to 1, extending out to specified distance
      1.upto(distance) do |x|
        #up
        self.img[row-x][column] = 1 unless row - x < 0
        #right
        self.img[row][column+x] = 1 unless column + x > width - 1
        #down
        self.img[row+x][column] = 1 unless row + x > height - 1
        #left
        self.img[row][column-x] = 1 unless column - x < 0

        #fill up and down 1 row simultaneously
        if x > 1

          #transpose
          transpose = x - 1
          row_up = row - transpose
          row_down = row + transpose

          #fill column by column
          1.upto(distance - transpose) do |y|
            col_left = column - y
            col_right = column + y

            #upper row
            self.img[row_up][col_left] = 1 unless row_up < 0 || col_left < 0
            self.img[row_up][col_right] = 1 unless row_up < 0 || col_right > width - 1

            #lower row
            self.img[row_down][col_left] = 1 unless row_down > height - 1 || col_left < 0
            self.img[row_down][col_right] = 1 unless row_down > height - 1 || col_right > width - 1

          end
        end
      end
    end
  end

end


# testing
image = Image.new([[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[1, 0, 0, 0, 0, 0, 0, 0, 1, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 1, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0]])

image.output
image.blur(4)
image.output
