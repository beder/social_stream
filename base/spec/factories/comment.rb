FactoryGirl.define do
  sequence(:comment_seq)  { |n| n }
  
  factory :comment do
    text { "Comment #{ generate(:comment_seq) }" }
    _contact_id { create(:friend).contact_id }
    _relation_ids { |q| Array(Contact.find(q._contact_id).sender.relation_customs.sort.first.id) }
  end
end
