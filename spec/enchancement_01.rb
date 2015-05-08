require './spec_helper'

describe Robot do
  before :each do
    @robot = Robot.new
  end

  describe "#heal!" do

    it "increases health" do
      @robot.wound(40)
      @robot.heal!(20)
      expect(@robot.health).to eq(80)
    end

    it "raises an exception if the robot is already at 0 health" do
      allow(@robot).to receive(:health).and_return(0)
      expect{ @robot.heal!(10) }.to raise_error(RobotAlreadyDeadError)
    end
  end
end
