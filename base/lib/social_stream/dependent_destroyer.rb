require 'active_support/concern'

module SocialStream
  module DependentDestroyer
    extend ActiveSupport::Concern
    
    included do
    end
        
    module ClassMethods
      def dependent_destroy_one(what)
        after_destroy "destroy_#{what}"
        define_method("destroy_#{what}") do
          return unless self.send(what)
          begin
            self.send(what).reload
            self.send(what).destroy
          rescue ActiveRecord::RecordNotFound => e
            nil
          end
        end
      end

      def dependent_destroy_many(what)
        after_destroy "destroy_#{what}"
        define_method("destroy_#{what}") do
          return unless self.send(what).present?
          self.send(what).each do |e| 
            begin
              e.reload
              e.destroy
            rescue ActiveRecord::RecordNotFound => e
              nil
            end
          end
        end
      end
    end
  end
end
