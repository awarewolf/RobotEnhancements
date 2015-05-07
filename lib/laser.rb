require_relative 'item'

class Laser < Weapon

  def initialize(name='Laser',weight=125, damage=25)
    super(name, weight, damage)
  end

end
