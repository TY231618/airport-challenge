describe 'user stories' do
  let(:airport) { Airport.new(20, weather_reporter) }
  let(:plane) { Plane.new }
  let(:weather_reporter) { WeatherReporter.new }

  context 'when not stormy' do
    before do
      allow(weather_reporter).to receive(:stormy?).and_return false
    end
    # As an air traffic controller
    # So planes can land safely at my airport
    # I would like to instruct a plane to land
    it 'instructs a plane to land at an airport'do
      expect { airport.land(plane) }.not_to raise_error
    end

      # As an air traffic controller
      # So planes can take off safely from my airport
      # I would like to instruct a plane to take off
    it 'instructs a plane to take off from an airport' do
      expect { airport.take_off(plane) }.not_to raise_error
    end

    # As an airtraffic controller
    # So that I can avoid collisions
    # I want to prevent airplanes landing when my airport is full
    context 'when airport full' do
      it 'prevents planes landing' do
        20.times do
          airport.land(plane)
        end
        expect { airport.land(plane)}.to raise_error 'Cannot land plane: airport is full'
      end
    end
  end
  # As an air traffic controller
  # So that I can avoid accidents
  # I want to prrevent airplanes landing or taking off when the weather is stormy
  context 'when weather is stormy' do
    before do
      allow(weather_reporter).to receive(:stormy?).and_return true
    end
    it 'does not allow planes to land' do
      expect { airport.land(plane) }.to raise_error 'Cannot land plane: weather is stormy'
    end
    it 'does not allow plans to take off' do
      expect { airport.take_off(plane)}.to raise_error 'Cannot take off: weather is stormy'
    end
  end

  # As an air traffic controller
  # So that I can ensure safe take off procedures
  # I want planes to only take off from the airport they are at


end
