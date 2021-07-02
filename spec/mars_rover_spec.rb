# spec/mars_rover_spec.rb
require 'mars_rover'

describe MarsRover do
  new_game = MarsRover.new
  new_game.set_plateau_size('5 5')
  describe '#plateau_size' do
    context 'when a user sets up a new game' do
      new_game = MarsRover.new
      it 'can set the size of the plateau' do
        new_game.set_plateau_size('5 5')
        expect(new_game.plateau_size).to eq([5, 5])
      end
    end
  end

  # describe '#set_position' do
  #
  #     it 'prompts the user to set a position' do
  #       expect(MarsRover.new([5,5])).to output("Please input your Rovers coordinates\n").to_stdout
  #     end
  #   end
  # end
  #
  describe '#set_position (error messages)'do

    context 'when a user sets too many digits or letters' do
      it 'errors' do
        expect {new_game.set_position('1 2 N S')}.to raise_error('Invalid: Please enter an x, y and a direction')
      end
    end

    context 'when a user sets too few digits or letters' do
      it 'errors' do
        expect {new_game.set_position('1 2')}.to raise_error('Invalid: Please enter an x, y and a direction')
      end
    end

    context 'when a user puts the coordinates in the wrong order' do
      it 'errors' do
        expect {new_game.set_position('N 2 1')}.to raise_error('Invalid: Please enter an x, y and a direction')
        expect {new_game.set_position('2 N 1')}.to raise_error('Invalid: Please enter an x, y and a direction')
      end
    end

    context 'when a user enters incorrect letters' do
      it 'errors' do
        expect {new_game.set_position('2 1 F')}.to raise_error('Invalid direction given: Please enter N, E, S or W, precided by two digits')
      end
    end

    context 'when a user enters a position outside of the size of the plateau' do
      it 'errors' do
        expect {new_game.set_position('6 1 N')}.to raise_error('Invalid: the position must not be greater than the size of the plateau')
        expect {new_game.set_position('1 6 N')}.to raise_error('Invalid: the position must not be greater than the size of the plateau')
      end
    end

  end

  describe '#instructions' do
    context 'when a user moves L from N position' do
      before do
        new_game.set_position('1 2 N')
        new_game.instructions('L')
      end
      it 'direction becomes W' do
        expect(new_game.final_position).to eq '1 2 W'
      end
    end

    context 'when a user moves L from E position' do
      before do
        new_game.set_position('1 2 E')
        new_game.instructions('L')
      end

      it 'direction becomes N' do
        expect(new_game.final_position).to eq '1 2 N'
      end
    end

    context 'when a user moves L from S position' do
      before do
        new_game.set_position('1 2 S')
        new_game.instructions('L')
      end

      it 'direction becomes E' do
        expect(new_game.final_position).to eq '1 2 E'
      end
    end

    context 'when a user moves L from W position' do
      before do
        new_game.set_position('1 2 W')
        new_game.instructions('L')
      end

      it 'direction becomes S' do
        expect(new_game.final_position).to eq '1 2 S'
      end
    end

    context 'when a user moves R from N position' do
      before do
        new_game.set_position('1 2 N')
        new_game.instructions('R')
      end

      it 'direction becomes E' do
        expect(new_game.final_position).to eq '1 2 E'
      end
    end

    context 'when a user moves R from E position' do
      before do
        new_game.set_position('1 2 E')
        new_game.instructions('R')
      end

      it 'direction becomes S' do
        expect(new_game.final_position).to eq '1 2 S'
      end
    end
  end
end