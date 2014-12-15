require 'active_support/concern'
require 'social_stream/dependent_destroyer'

module SocialStream #:nodoc:
  module Models
    # Common methods for models that have subtypes. Currently, there are two supertypes:
    # * Actor: participates in the social network and has ties with other actors. Its subtypes are subjects, like user or group
    # * ActivityObject: created and managed by actors in activities. Its subtypes are objects, like post or comment
    module Supertype
      extend ActiveSupport::Concern

      included do
        include SocialStream::DependentDestroyer
        subtypes.each do |s|
          has_one s #, :dependent => :destroy          
          #TODO: re-evaluate when moving to rails 4.2 (circular dependent destroy should work there)
          dependent_destroy_one s
          # after_destroy "destroy_#{s}"
          # define_method("destroy_#{s}") do
          #   return unless self.send(s)
          #   begin
          #     self.send(s).reload
          #     self.send(s).destroy
          #   rescue ActiveRecord::RecordNotFound => e
          #     nil
          #   end
          # end
        end
      end

      module ClassMethods
        def subtypes_name
          @subtypes_name
        end

        def subtypes
          SocialStream.__send__ subtypes_name.to_s.tableize # SocialStream.subjects # in Actor
        end
      end 

        def subtype_instance
          if __send__("#{ self.class.subtypes_name }_type").present?      # if object_type.present?
            object_class = __send__("#{ self.class.subtypes_name }_type") #   object_class = object_type # => "Video"
            __send__ object_class.constantize.base_class.to_s.underscore  #   __send__ "document"
                       end                                                # end
        end
    end
  end
end
