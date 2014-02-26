describe "SerializedPageResponder" do 
  it "get page hierarchy as xml" do 
    given_pages("PageOne", "PageOne.ChildOne", "PageTwo")
    request_is_issued("root", "type:pages")# Notice the formatting.  There is a space between the set up and the assertion.

    response.should == XML
  end

  it "page hierarchy has xml" do 
    given_pages("PageOne", "PageOne.ChildOne", "PageTwo")
    request_is_issued("root", "type:pages")

    response.should_include("<name>PageOne</name>", "<name>PageTwo</name>", "<name>ChildOne</name>")
  end
end