require 'spec_helper'

describe User do
  before do
    @user = create(:user)
  end

  it "should find by slug" do
    assert @user.should == User.find_by_slug(@user.slug)
  end

  context "member of a group" do
    before do
      tie = create(:member, :contact => create(:group_contact, :receiver => @user.actor))
      @group = tie.sender_subject
    end

    context "without accept the group" do
      it "should not represent" do
        @user.represented.should_not include(@group)
      end
    end

    context "accepting the group" do
      before do
        create(:friend, :contact => @user.contact_to!(@group))
      end

      it "should represent" do
        @user.represented.should include(@group)
      end
    end
  end

  context "partner of a group" do
    before do
      tie = create(:partner, :contact => create(:group_contact, :receiver => @user.actor))
      @group = tie.receiver_subject
    end

    context "without accept the group" do
      it "should not represent" do
        @user.represented.should_not include(@group)
      end
    end

    context "accepting the group" do
      before do
        create(:friend, :contact => @user.contact_to!(@group))
      end

      it "should not represent" do
        @user.represented.should_not include(@group)
      end
    end
  end

  context "public of a group" do
    before do
      tie = create(:group_public, :contact => create(:group_contact, :receiver => @user.actor))
      @group = tie.receiver_subject
    end

    context "without accept the group" do
      it "should not represent" do
        @user.represented.should_not include(@group)
      end
    end

    context "accepting the group" do
      before do
        create(:friend, :contact => @user.contact_to!(@group))
      end

      it "should not represent" do
        @user.represented.should_not include(@group)
      end
    end
  end

  it "should have activity object" do
    create(:user).activity_object.should be_present
  end

  it "should update password" do
    user = create(:user)
    user.password = "testing"
    user.password_confirmation = "testing"

    assert user.save
  end
end

