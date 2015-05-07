class Robot
  
  MAX_WEIGHT = 250

  attr_reader :x, :y, :items, :health

  def initialize(x=0,y=0,items=[],health=100)
    @x = x
    @y = y
    @items = items
    @health = health
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
    if items_weight <= 250
      if (item.weight + items_weight) <= 250
        items << item
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
    if (@health + hp) <= 100
      @health += hp
    else
      @health = 100
    end
  end

  def attack(enemy)
    enemy.wound(5)
  end

  def feed(food)
    if food.name == 'Box of bolts'
      heal(20)
    end
  end
end
