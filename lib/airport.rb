class Airport

  def initialize(capacity)
    @capacity = capacity
    @grounded_planes = []
  end

  def land(plane)
    raise 'Cannot land plane: airport is full' if full?
    @grounded_planes << plane
  end

  def take_off(plane)
  end

private

  def full?
    @grounded_planes.length >= @capacity
  end
end
