class RelationPermission < ActiveRecord::Base
  
  belongs_to :relation, :inverse_of=>:relation_permissions
  
  belongs_to :permission, :inverse_of=>:relation_permissions
  
end
