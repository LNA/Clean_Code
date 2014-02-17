module AR
  class Guest << ActiveRecord::Base
    has_many :orders, class_name "Orders"
    has_many :drinks, through: :orders, class_name: "Orders"
    def drinks
      drinks_array = [ ]
      AR::Orders.all.each do |relationship|
        if relationship.guest_id == self.id
          drinks_array << relationship.drink
        end
      end
      drinks_array
    end
  end
end

# This module is loaded with code smells.  We are repeating ourselves; the phrase class_name: "Orders appears twice.  The method is getting fat. 
# The drinks method is conditionally complex; we can simplify the if logic block and make it easier to read.

# The smell that applies to this chapter occurs on line 7. There are two dots indicating
# that we are violating the Law of Demeter.  We should be talking to our neighbor, not our neighbors neighbor.
# Just by fixing this one code smell we fix a host of problems.  We und up with a module that is smaller, DRYer and easier to read:

module AR
  class Guest << AcitveRecord::Base
    has_many :ordes, class_name: "Orders"
    def drinks
      AR::Orders.where("guest_id = ?", self.id).map do |relationship|
        relationship.drink
      end
    end
  end
end
