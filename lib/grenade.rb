class Grenade < Weapon

  attr_reader :single_use

  def initialize(weight=40, damage=15,range=2,single_use=true)
    super('Grenade', weight, damage,range)
  end

end
