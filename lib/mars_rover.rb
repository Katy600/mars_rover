
class MarsRover
  attr_reader :plateau_size

  def initialize(size)
    @plateau_size = size
    print "Please input your Rovers coordinates"
  end

  def set_position(position)
    raise_error_message(position)
    initial_coordinates(position).map(&:to_i) + initial_direction(position)
  end

  private

  def raise_error_message(position)
    if wrong_number_of_digits(position) || wrong_order?(position)
      raise StandardError.new 'Invalid: Please enter an x, y and a direction'
    end
  end

  def initial_direction(position)
    [position.split(" ")[2]]
  end

  def initial_coordinates(position)
    position.split(" ").shift(2)
  end

  private

  def wrong_order?(position)
    ['N', 'E', 'S', 'W'].difference(initial_coordinates(position)).size < 4
  end

  def wrong_number_of_digits(position)
    position.split(" ").size >= 4 || position.split(" ").size <= 2
  end
end