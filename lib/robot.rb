
class Robot

  MAX_WEIGHT = 250
  MAX_HEALTH = 100
  DEFAULT_AP = 5
  BOX_OF_BOLTS_HP = 20

  attr_reader :x, :y, :items
  attr_accessor :equipped_weapon, :health #Test 12 requires health to be accessor?

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
    if (item.weight + items_weight) <= MAX_WEIGHT
      if item.is_a?(BoxOfBolts) && hungry_for_bolts?
        item.feed(self)
      else
        @items << item
      end
      @equipped_weapon = item if item.is_a? Weapon
    else
      return false
    end
    true
  end

  def hungry_for_bolts?
    health <= (MAX_HEALTH - BOX_OF_BOLTS_HP)
  end

  def items_weight
    unless items.empty?
      # @items.inject(0){|sum,item| sum + items.weight} Arvinder
      items.map { |item| item.weight }.reduce(:+)
    else
      0
    end
  end

  def wound(hp)
    if (health - hp) >= 0
      @health -= hp
    else
      @health = 0
    end
  end

  def heal(hp)
    if (health + hp) <= MAX_HEALTH
      @health += hp
    else
      @health = MAX_HEALTH
    end
  end

  def heal!(hp)
    if health > 0
      heal(hp)
    else
      raise RobotAlreadyDeadError
    end
  end

  def distance(target)
    [position, target.position].transpose.map { |x| x.reduce(:-) }
  end

  def in_range?(target)
    unless self.equipped_weapon.nil?
      attack_range = self.equipped_weapon.range
    else
      attack_range = 1
    end
    distance(target).all? { |units| units.abs <= attack_range }
  end

  def attack(enemy)
    if in_range?(enemy)
      unless equipped_weapon.nil?
        equipped_weapon.hit(enemy)
        equipped_weapon = nil if equipped_weapon.single_use
      else
        enemy.wound(DEFAULT_AP)
      end
    end
  end

  def attack!(enemy)
    if enemy.is_a? Robot
      attack(enemy)
    else
      raise UnattackableEnemy
    end
  end
end
