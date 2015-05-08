class RobotAlreadyDeadError < Exception
  def message
    "This robot is dead. Leave it alone!"
  end
end

class UnattackableEnemy < Exception
  def message
    "Wat u talkin' bout, that ain't no robot!"
  end
end