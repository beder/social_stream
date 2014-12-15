FactoryGirl.define do
  factory :activity do
    contact { create(:friend).contact }
    activity_verb { ActivityVerb["post"] }
    relation_ids  { |b| Array(b.sender.relation_custom('friend').id) }

    factory :self_activity do
      contact { create(:self_contact) }
      relation_ids  { |b| Array(b.sender.relation_custom('friend').id) }
    end

    factory :public_activity do
      relation_ids  { |b| Array(b.sender.relation_public.id) }

      factory :fan_activity do
        activity_objects { |b| Array(b.receiver.activity_object) }
      end
    end

    factory :like_activity do
      association :parent, :factory => :activity
      contact { |b| create(:friend, :sender => b.parent.sender).receiver.contact_to!(b.parent.sender) }
      activity_verb { ActivityVerb["like"] }
      relation_ids { |b| Array(b.parent.contact.ties.first.relation.id) }
    end
  end
end

