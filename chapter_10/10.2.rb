# Small Enough?

class SuperDashBoard
  include MetaDataUser
  def initialize(last_focused)
    @last_focused_component = Component.new
    @last_focused = last_focused
    @major_version_number = 0
    @minor_version_number = 0
    @build_number = 0
  end
end

# If we can't come up with a concise name for a class its probably doing too much
# Class name should never contain or if, and, or but.  If so it may have
# too many responsibilities 