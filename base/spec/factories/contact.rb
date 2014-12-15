FactoryGirl.define do

  factory :contact do
    sender   { |s| create(:user).actor }
    receiver { |r| create(:user).actor }

    factory :self_contact do
      receiver { |d| d.sender }
    end

    factory :group_contact do
      sender { |s| create(:group).actor }

      factory :g2g_contact do
        receiver { |r| create(:group).actor }
      end
    end

  end

end
