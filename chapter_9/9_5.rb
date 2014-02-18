describe "EnvironmentController" do 
  it "turns on cooler and blower if too hot" do 
    too_hot

    hw.get_state.should == "hBChl"
  end

  it "turns on heater and blower if too cold" do 
    too_cold

    hw.get_state.should == "HBchl"
  end

  it "turns on hi temp alarm at threshold" do
    way_too_hot

    hw.get_state.should == "hBCHl"
  end

  it " turns on lo temp alarm at threshold" do
    way_too_cold

    hw.get_state.should == "HBchL"
  end
end

