describe "SerializedPageResponder" do 
  let (:crawler) {Crawler.new}
  let (:request) {Request.new}

  it "gets page hieratchy as Xml" do 
    makes_pages("PageOne", "PageOne.ChildOne", "PageTwo")
    submit_request("root", "type:pages")

    response.should_include("<name>PageOne</name>", "<name>PageTwo</name>", "<name>ChildOne</name>") 
  end

  it "tests that symbolic links are not in xml page hierarchy" do
    page = Wikipage.new.makes_page("PageOne")
    make_pages("PageOne.ChildOne", "PageTwo")
    add_link_to(page, "PageTwo", "SymPage")
    submit_request("root", "type:pages") # too much set up
    
    response.should_include("<name>PageOne</name>", "<name>PageTwo</name>", "<name>ChildOne</name>") # duplication
  end

  it "gets data as xml" do 
    make_page_with_content("TestPageOne", "test page")
    submit_request("TestPageOne", "type:data")
   
   response.type.should == "XML"
   response,should_include("test page", "<Test") # one assertion per test!
  end
end