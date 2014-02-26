describe 'EnvironmentController' do 
  it "turns on the lo temp alarm at threashold" do 
    hw.set_temp(WAY_TOO_COLD) # Its better to pass no arguments.  The argument should be made into a method.  See 9.4
    controller.tic # tic id not a good method name.  What does it do?

    hw.heater_state.should == true # too many tests 
    hw.blower_state.should == true
    hw.cooler_state.should == false 
    hw.hi_temp_slarm.should == false
    hw.lo_temp_alarm.should == true
  end
end
