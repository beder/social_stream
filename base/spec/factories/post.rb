FactoryGirl.define do
  sequence(:post_seq)  { |n| n }

  factory :post do
    text { "Post #{ generate(:post_seq) }" }
    _contact_id { create(:friend).contact_id }
    _relation_ids { |q| Array(Contact.find(q._contact_id).sender.relation_customs.sort.first.id) }

    factory :public_post do
      _contact_id { create(:self_contact).id }
      _relation_ids { |q| Array(Contact.find(q._contact_id).sender.relation_public.id) }
    end

  end

end
