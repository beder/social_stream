Paperclip::AttachmentRegistry.class_eval do
  def definitions_for(klass)
    klass.ancestors.reverse.each_with_object({}) do |ancestor, inherited_definitions|
      inherited_definitions.merge! @attachments[ancestor]
    end
  end
end
