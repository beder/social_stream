class ActivityVerb < ActiveRecord::Base
  # Activity Strems verbs
  Available = %w(follow like make_friend post update)

  validates_uniqueness_of :name

  has_many :activities, :inverse_of => :activity_verb

  scope :verb_name, lambda{ |n|
    where(:name => n)
  }

  class << self
    def [] name
      if Available.include?(name)
        find_or_create_by(name:name)
      else
        raise "ActivityVerb not available: #{ name }"
      end
    end
  end
end
