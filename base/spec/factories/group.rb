FactoryGirl.define do
  sequence(:group_seq) { |n| n }
  
  factory :group do
    name { "Group #{ generate(:group_seq) }" }
    _contact_id { |g| create(:user).ego_contact.id }
  end
end
