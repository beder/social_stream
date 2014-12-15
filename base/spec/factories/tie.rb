FactoryGirl.define do

  factory :tie do
    association :contact

    # User ties

    factory :friend do
      after(:build) do |u, e| 
        u.relation = u.sender.relation_custom('friend') 
        end
    end

    factory :acquaintance do
      after(:build) do |u, e| 
        u.relation = u.sender.relation_custom('acquaintance') 
        end
    end

    factory :public do
      after(:build) do |u, e| 
        u.relation = u.sender.relation_public 
        end
    end

    factory :reject do
      after(:build) do |u, e| 
        u.relation = u.sender.relation_reject 
        end
    end

    # Group ties
    factory :g2u_tie do
      contact { |c| create(:group_contact) }
      factory :member do
        after(:build) do |u, e| 
          u.relation = u.sender.relation_custom('member') 
        end
      end

    end

    factory :g2g_tie do
      contact { |c| create(:g2g_contact) }

      factory :partner do
        after(:build) do |u, e| 
          u.relation = u.sender.relation_custom('partner') 
        end
      end

      factory :group_public do
        after(:build) do |u, e| 
          u.relation = u.sender.relation_public 
        end
      end
    end
  end



end

