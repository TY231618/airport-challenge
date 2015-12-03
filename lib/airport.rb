class Airport

  def initialize(capacity, weather_reporter)
    @capacity = capacity
    @weather_reporter = weather_reporter
    @grounded_planes = []
  end

  def land(plane)
    raise 'Cannot land plane: airport is full' if full?
    raise 'Cannot land plane: weather is stormy' if stormy?
    @grounded_planes << plane
  end

  def take_off(plane)
    raise 'Cannot take off: weather is stormy' if stormy?
    @grounded_planes.pop
  end

private

  def full?
    @grounded_planes.length >= @capacity
  end

  def stormy?
    @weather_reporter.stormy?
  end

end
