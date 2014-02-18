describe "SerializedPageResponder" do 
  it "get page hierarchy as xml" do 
    given_pages("PageOne", "PageOne.ChildOne", "PageTwo")
    request_is_issued("root", "type:pages")

    response.should == XML
  end

  it "page hierarchy has xml" do 
    given_pages("PageOne", "PageOne.ChildOne", "PageTwo")
    request_is_issued("root", "type:pages")

    response.should_include("<name>PageOne</name>", "<name>PageTwo</name>", "<name>ChildOne</name>")
  end
end