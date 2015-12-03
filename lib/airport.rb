class Airport

  def initialize(capacity)
    @capacity = capacity
    @grounded_planes = []
  end

  def land(plane)
    raise 'Cannot land plane: airport is full' if full?
    raise 'Cannot land plane: weather is stormy' if stormy?
    @grounded_planes << plane
  end

  def take_off(plane)
  end

private

  def full?
    @grounded_planes.length >= @capacity
  end

  def stormy?
    rand(1..6) > 4
  end

end
