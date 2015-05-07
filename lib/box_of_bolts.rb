require_relative 'item'

class BoxOfBolts < Item

  def initialize(name='Box of bolts',weight=25)
    super(name, weight)
  end

  def feed(robot)
    robot.heal(20)
  end

end
