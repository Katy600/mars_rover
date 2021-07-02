
class MarsRover
  attr_reader :plateau_size

  def initialize
    print "Please input your Rovers coordinates"
  end

  def set_plateau_size(coordinates)
    @plateau_size = coordinates.split(' ').map(&:to_i)
  end

  def set_position(position)
    raise_error_message(position)
    given_coordinates(position) + initial_direction(position)
  end

  private

  def raise_error_message(position)
    case true
      when wrong_number_of_digits(position) || wrong_order?(position)
        raise StandardError.new 'Invalid: Please enter an x, y and a direction'
      when incorrect_letter?(position)
        raise StandardError.new 'Invalid direction given: Please enter N, E, S or W, precided by two digits'
      when out_side_plateau?(position)
        raise StandardError.new 'Invalid: the position must not be greater than the size of the plateau'
    end
  end

  def given_coordinates(position)
    initial_coordinates(position).map(&:to_i)
  end

  def out_side_plateau?(position)
    @plateau_size.zip(given_coordinates(position)).map { |plateau_size, given_coordinates| true if given_coordinates > plateau_size}.include?(true)
  end

  def initial_direction(position)
    [position.split(" ")[2]]
  end

  def initial_coordinates(position)
    position.split(" ").shift(2)
  end

  def wrong_order?(position)
    ['N', 'E', 'S', 'W'].difference(initial_coordinates(position)).size < 4
  end

  def incorrect_letter?(position)
    ['N', 'E', 'S', 'W'].difference(initial_direction(position)).size == 4
  end

  def wrong_number_of_digits(position)
    position.split(" ").size >= 4 || position.split(" ").size <= 2
  end
end