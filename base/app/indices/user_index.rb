ThinkingSphinx::Index.define :user, :with => :active_record do
  indexes actor.name, :sortable => true
  indexes actor.email
  indexes actor.slug
        
  has created_at
end