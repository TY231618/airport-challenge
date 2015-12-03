describe 'user stories' do
  # As an air traffic controller
  # So planes can land safely at my airport
  # I would like to instruct a plane to land
  it 'instructs a plane to land at an airport'do
    airport = Airport.new(20)
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return false
    expect { airport.land(plane) }.not_to raise_error
  end

  # As an air traffic controller
  # So planes can take off safely from my airport
  # I would like to instruct a plane to take off
  it 'instructs a plane to take off from an airport' do
    airport = Airport.new(20)
    plane = Plane.new
    expect { airport.take_off(plane) }.not_to raise_error
  end

  # As an airtraffic controller
  # So that I can avoid collisions
  # I want to prevent airplanes landing when my airport is full
  context 'when airport full' do
    it 'prevents planes landing' do
      airport = Airport.new(20)
      plane = Plane.new
      allow(airport).to receive(:stormy?).and_return false
      20.times do
        airport.land(plane)
      end
      expect { airport.land(plane)}.to raise_error 'Cannot land plane: airport is full'
    end
  end


  # As an airtraffic controller
  # So that I can avoid accidents
  # I want to prrevent airplanes landing or taking off when the weather is stormy
  context 'when weather is stormy' do
    it 'does not allow planes to land' do
      airport = Airport.new(20)
      plane = Plane.new
      allow(airport).to receive(:stormy?).and_return true
      expect { airport.land(plane) }.to raise_error 'Cannot land plane: weather is stormy'
    end
  end




end
