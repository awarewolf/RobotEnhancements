
class Robot

  MAX_WEIGHT = 250
  MAX_HEALTH = 100
  DEFAULT_AP = 5

  attr_reader :x, :y, :items, :health
  attr_accessor :equipped_weapon

  def initialize(x=0,y=0,items=[],health=100,equipped_weapon=nil)
    @x = x
    @y = y
    @items = items
    @health = health
    @equipped_weapon = equipped_weapon
  end

  def position
    [x,y]
  end

  def move_left
    @x -= 1
    position
  end

  def move_right
    @x += 1
    position
  end

  def move_up
    @y += 1
    position
  end

  def move_down
    @y -= 1
    position
  end

  def pick_up(item)
    if items_weight <= MAX_WEIGHT # redundant
      if (item.weight + items_weight) <= MAX_WEIGHT
        items << item
        if item.is_a? Weapon
          @equipped_weapon = item
        end
      else
        return false
      end
    else
      return false
    end
    true
  end

  def items_weight
    unless items.empty?
      # @items.inject(0){|sum,item| sum + items.weight}
      items.map { |item| item.weight }.reduce(:+)
    else
      0
    end
  end

  def wound(hp)
    if (@health - hp) >= 0
      @health -= hp
    else
      @health = 0
    end
  end

  def heal(hp)
    if (@health + hp) <= MAX_HEALTH
      @health += hp
    else
      @health = MAX_HEALTH
    end
  end

  def heal!(hp)
    if health > 0
      heal(hp)
    else
      raise DeadRobotException
    end
  end
  
  def attack(enemy)
    unless equipped_weapon.nil?
      @equipped_weapon.hit(enemy)
    else
      enemy.wound(DEFAULT_AP)
    end
  end

end
