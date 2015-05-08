require './spec_helper'

describe Robot do
  before :each do
    @robot = Robot.new
  end

    describe "#attack!" do
    it "wounds other robot with weak default attack (5 hitpoints)" do
      robot2 = Robot.new
      expect(robot2).to receive(:wound).with(5)
      @robot.attack!(robot2)
    end

    it "raises an exception if the enemy is an Item" do
      subject = Item.new
      expect{ @robot.attack!(subject) }.to raise_error(UnattackableEnemy)
    end

    it "raises an exception if the enemy is a Box of bolts" do
      subject = BoxOfBolts.new
      expect{ @robot.attack!(subject) }.to raise_error(UnattackableEnemy)
    end

    it "raises an exception if the enemy is a Weapon" do
      subject = Weapon.new
      expect{ @robot.attack!(subject) }.to raise_error(UnattackableEnemy)
    end

    it "raises an exception if the enemy is a Laser" do
      subject = Laser.new
      expect{ @robot.attack!(subject) }.to raise_error(UnattackableEnemy)
    end

    it "raises an exception if the enemy is a Plasma Cannon" do
      subject = PlasmaCannon.new
      expect{ @robot.attack!(subject) }.to raise_error(UnattackableEnemy)
    end
  end
end
