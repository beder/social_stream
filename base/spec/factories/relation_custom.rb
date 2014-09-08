FactoryGirl.define do
  sequence(:relation_custom_seq) { |n| n }

  factory(:relation_custom, :class => Relation::Custom) do
    name { "Relation custom #{ generate(:relation_custom_seq) }" }
    actor { create(:user).actor }
  end

end
