require_relative 'item'

class Weapon < Item

  def initialize(name='',weight=0)
    super(name, weight)
  end

end
