describe "SerializedPageResponder" do 
  let (:crawler) {Crawler.new}
  let (:request) {Request.new}

  it "gets page hieratchy as Xml" do # This test is too long; not readable
    crawler.addPage(root, PathParser.parse("PageOne")) # Irrelevent to test
    crawler.addPage(root, PathParser.parse("PageOne.ChildOne")) # Irrelevent to test
    crawler.addPage(root, PathParser.parse("PageTwo")) # Irrelevent to test
    request.setResource("root"); 
    request.addInput("type", "pages");
    responder = SerializedPageResponder.new # shouldn't initialize instance variable inside of tests
    response = SimpleResponse.new
    responder.make_response
    xml = response.get_content

    # too much set up
    # omitted code

    response.get_content_type.should == "text/xml"
    sub_string("<name>PageOne</name>").should == xml
    sub_string("<name>PageTwo</name>").should == xml
    sub_string("<name>ChildOne</name>").should == xml # testing more than one thing
  end

  it "gets page hieratchy as xml doesnt contain symbolic links" do
    page_one = crawler.addPage(root, PathParser.parse("PageOne"))
    crawler.add_page(root, PathParser.parse("PageOne.ChildOne")) 
    crawler.add_page(root, PathParser.parse("PageTwo")) # duplication
    data = page_one.get_data
    properties = data.get_properties
    sym_links = properties.set(SymbolicPage.PROPERTY_NAME)
    sym_links.set("SymPage", "PageTwo")
    page_one.commit(data)
    request.set_resource("root")
    request.add_input("type", "pages")
    responder = SerializedPageResponder.new #duplication
    response = SimpleResponse.new
    responder.make_response

    response.get_content_type.should == "text/xml"
    sub_string("<name>PageOne</name>").should == xml
    sub_string("<name>PageTwo</name>").should == xml
    sub_string("<name>ChildOne</name>").should == xml # more duplication
    not_sub_string("SymPage").should == false

  end

  it "gets data as HTML" do 
    crawler.add_page(root, PathParser.parse("TestPageOne"), "test page")
    request.set_resource("TestPageOne")
    request.add_input("type", "data");
    responder = SerializedPageResponder.new

    response = responder.makeResponse( FitNesseContext(root).new, request);
    xml = response.get_content
    response.get_content_type.should == "text/xml"
    xml.should == "test page" 
    xml.should == "<Test"
  end