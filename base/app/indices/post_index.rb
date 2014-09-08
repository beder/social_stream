ThinkingSphinx::Index.define :post, :with => :active_record do
  indexes text

  has created_at
end