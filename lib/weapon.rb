require_relative 'item'

class Weapon < Item

  attr_reader :damage

  def initialize(name='',weight=0, damage=45)
    super(name, weight)
    @damage = damage
  end

  def hit(robot)
    robot.wound(@damage)
  end

end
