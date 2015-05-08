
class Weapon < Item

  attr_reader :damage, :range, :single_use

  def initialize(name='',weight=0, damage=45,range=1,single_use=false)
    super(name, weight)
    @damage = damage
    @range = range
    @single_use = single_use
  end

  def hit(robot)
    robot.wound(@damage)
  end

end
