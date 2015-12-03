class Airport

  def initialize(capacity)
    @capacity = capacity
    @grounded_planes = []
  end

  def land(plane)
    raise 'Cannot land plane: airport is full' if @grounded_planes.length >= @capacity
    @grounded_planes << plane
  end

  def take_off(plane)
  end

end
