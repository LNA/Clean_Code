describe "AddMonths" do 
  it "adds months" do 
    d1 = SerialDate.new(31, 5, 2004)
    d2 = SerialDate.new.add_months(1, d1)

    d2.day_of_month.should == 30
    d2.month.should == 6
    d2.YYYY.should == 2004

    d3 = SerialDate.new.add_months(2, d1); 
    d3.day_of_month.should == 31 
    d3.month.should == 7
    d3.YYYY.should == 2004

    d4 = SerialDate.new.add_months(1, SerialDate.addMonths(1, d1)
    d4.day_of_month.should == 30
    d4.month.should == 7
    d4.YYYY.should == 2004
  end
end