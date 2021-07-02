# spec/mars_rover_spec.rb
require 'mars_rover'

describe MarsRover do

  describe '#plateau_size' do
    context 'when a user sets up a new game' do
      new_game = MarsRover.new([5,5])
      it 'expects to initialize with the size of the plateau' do
        expect(new_game.plateau_size).to eq([5,5])
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
  describe '#set_position'do
    new_game = MarsRover.new([5,5])

    context 'user sets the position correctly' do
      it 'accepts it' do
        expect(new_game.set_position('1 2 N')).to eq [1,2,'N']
      end
    end

    context 'user sets too many digits or letters' do
      it 'errors' do
        expect {new_game.set_position('1 2 N S')}.to raise_error('Invalid: Please enter an x, y and a direction')
      end
    end

    context 'user sets too few digits or letters' do
      it 'errors' do
        expect {new_game.set_position('1 2')}.to raise_error('Invalid: Please enter an x, y and a direction')
      end
    end

    context 'user puts the coordinates in the wrong order' do
      it 'errors' do
        expect {new_game.set_position('N 2 1')}.to raise_error('Invalid: Please enter an x, y and a direction')
        expect {new_game.set_position('2 N 1')}.to raise_error('Invalid: Please enter an x, y and a direction')
      end
    end

    context 'user puts in incorrect letters' do
      it 'errors' do
        expect {new_game.set_position('2 1 F')}.to raise_error('Invalid direction given: Please enter N, E, S or W, precided by two digits')
      end
    end

    context 'user enters a position outside of the size of the plateau' do
      it 'errors' do
        expect {new_game.set_position('6 1 N')}.to raise_error('Invalid: the position must not be greater than the size of the plateau')
        expect {new_game.set_position('1 6 N')}.to raise_error('Invalid: the position must not be greater than the size of the plateau')
      end
    end
  end
end