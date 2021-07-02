
class MarsRover
  attr_reader :plateau_size, :current_coordinates, :current_direction

  COMPASS_POINTS = ['N', 'E', 'S', 'W']

  def set_plateau_size(coordinates)
    @plateau_size = coordinates.split(' ').map(&:to_i)
  end

  def set_position(position)
    raise_error_message(position)
  end

  def instructions(direction)
    current_direction = COMPASS_POINTS.index(@current_direction)
    if direction == 'L'
      @current_direction = COMPASS_POINTS[current_direction - 1]
    else
      @current_direction = COMPASS_POINTS[current_direction + 1]
    end
  end

  def final_position
    @current_coordinates.join(' ') + ' ' + @current_direction
  end

  private

  def raise_error_message(position)
    case true
      when wrong_number_of_digits(position) || wrong_order?(position)
        raise StandardError.new 'Invalid: Please enter an x, y and a direction'
      when incorrect_letter?(position)
        raise StandardError.new 'Invalid direction given: Please enter N, E, S or W, precided by two digits'
      when out_side_plateau?
        raise StandardError.new 'Invalid: the position must not be greater than the size of the plateau'
    end
  end

  def initial_compass_direction(position)
    @current_direction = [position.split(" ")[2]].shift
    [position.split(" ")[2]]
  end

  def initial_coordinates(position)
    @current_coordinates = position.split(" ").shift(2).map(&:to_i)
    position.split(" ").shift(2)
  end

  def out_side_plateau?
    @plateau_size.zip(@current_coordinates).map { |plateau_size, given_coordinates| true if given_coordinates > plateau_size}.include?(true)
  end

  def wrong_order?(position)
    COMPASS_POINTS.difference(initial_coordinates(position)).size < 4
  end

  def incorrect_letter?(position)
    COMPASS_POINTS.difference(initial_compass_direction(position)).size == 4
  end

  def wrong_number_of_digits(position)
    position.split(" ").size >= 4 || position.split(" ").size <= 2
  end
end