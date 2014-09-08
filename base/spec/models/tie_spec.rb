require 'spec_helper'

describe Tie do
  describe "follower_count" do
    it "should be incremented" do
      sender, receiver = 2.times.map{ create(:user) }

      count = receiver.follower_count

      follower_relation = sender.
                          relation_customs.
                          joins(:permissions).
                          merge(Permission.follow).
                          first

      Tie.create :contact_id => sender.contact_to!(receiver).id,
                 :relation_id => follower_relation.id

      receiver.reload.follower_count.should eq(count + 1)
    end
    
    it "should be decremented" do
      tie = create(:friend)
      contact = tie.contact
      receiver = tie.receiver
      count = receiver.follower_count

      contact.reload.relation_ids = []

      receiver.reload.follower_count.should eq(count - 1)
    end
  end

  describe "friend" do
    before do
      @tie = create(:friend)
    end

    it "should create pending" do
      @tie.receiver.received_contacts.pending.should be_present
    end

    it "should create activity with follow verb" do
      @tie.contact.activities.should be_present
      @tie.contact.activities.first.verb.should eq('follow')
    end

    context "reciprocal" do
      before do
        @reciprocal = create(:friend, :contact => @tie.contact.inverse!)
      end

      it "should create activity with make_friend verb" do
        @reciprocal.contact.activities.should be_present
        @reciprocal.contact.activities.first.verb.should eq('make_friend')
      end
    end

  end

  describe "with public relation" do
    before do
      @tie = create(:public)
    end

    it "should create activity" do
      count = Activity.count

      create(:public)

      Activity.count.should eq(count + 1)
    end

    it "should be positive" do
      @tie.should be_positive
    end

    it "should not be positive replied" do
      @tie.should_not be_positive_replied
    end

    context "with public reply" do
      before do
        create(:public, :contact => @tie.contact.inverse!)

        # It should reload tie.contact again, as its inverse is now set
        @tie.reload
      end

      it "should be positive replied" do
        @tie.should be_positive_replied
      end

      it "should be bidirectional" do
        @tie.should be_bidirectional
      end
    end

    context "with reject reply" do
      before do
       create(:reject, :contact => @tie.contact.inverse!)

        # It should reload tie.contact again, as its inverse is now set
        @tie.reload
      end

      it "should not be positive replied" do
        @tie.should_not be_positive_replied
      end

      it "should not be bidirectional" do
        @tie.should_not be_bidirectional
      end
    end
  end

  describe "with reject relation" do
    before do
      @tie = create(:reject)
    end

    it "should not create activity" do
      count = Activity.count

      create(:reject)

      Activity.count.should eq(count)
    end

    it "should not be positive" do
      @tie.should_not be_positive
    end

    context "with public reply" do
      before do
        create(:public, :contact => @tie.contact.inverse!)

        # It should reload tie.contact again, as its inverse is now set
        @tie.reload
      end

      it "should be positive replied" do
        @tie.should be_positive_replied
      end

      it "should not be bidirectional" do
        @tie.should_not be_bidirectional
      end
    end

    context "with reject reply" do
      before do
       create(:reject, :contact => @tie.contact.inverse!)

        # It should reload tie.contact again, as its inverse is now set
        @tie.reload
      end

      it "should not be positive replied" do
        @tie.should_not be_positive_replied
      end

      it "should not be bidirectional" do
        @tie.should_not be_bidirectional
      end
    end
  end
end

