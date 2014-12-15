ThinkingSphinx::Index.define :video, :with => :active_record do
  indexes title
  indexes file_file_name, :as => :file_name
  indexes description
  indexes activity_object.tags.name, :as => :tags
  
  has created_at
end