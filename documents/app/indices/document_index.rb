ThinkingSphinx::Index.define :document, :with => :active_record do
  indexes title
  indexes file_file_name, :as => :file_name
  indexes description
  indexes activity_object.tags.name, :as => :tags
  
  where "type IS NULL"
  
  has created_at
end