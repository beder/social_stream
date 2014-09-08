# Every {Activity} is shared with one or more {audiences Audience}.
#
# Each {Audience} is equivalent to a {Relation}, which defines the {actors Actor}
# that are assigned to that relation and the {permissions Permission} granted to
# that {Audience}
class Audience < ActiveRecord::Base
  
  belongs_to :activity, :inverse_of => :audiences
  
  belongs_to :relation, :inverse_of => :audiences
  
end
