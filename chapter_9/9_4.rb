describe 'EnvironmentController' do 
  it "turns on the lo temp alarm at threashold" do 
    way_too_cold

    hw.get_state.should == "HBchL" # can quickly interperate the results
  end
end