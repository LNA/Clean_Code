class SuperDashBoard
  include JFrame
  include MetaDataUser

  def initialize(system_config_path)
    @get_customizer_language_path = ""
    @set_system_config_path = system_config_path
    @get_system_config_document = ""
    public void setSystemConfigDocument(String systemConfigDocument) 
    public boolean getGuruState()
    public boolean getNoviceState()
    public boolean getOpenSourceState()
    public void showObject(MetaObject object) 
    public void showProgress(String s)
  end
end