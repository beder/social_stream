require 'spec_helper'

describe UsersController do
  render_views

  describe "when Anonymous" do
    it "should render index" do
      get :index

      assert_response :success
    end

    it "should render show" do
      get :show, :id => create(:friend, :receiver => create(:group).actor).sender_subject.to_param

      assert_response :success
    end

    context "with fans" do
      before do
        @user = create(:fan_activity).receiver_subject
      end

      it "should render show" do
        get :show, :id => @user.to_param

        response.should be_success
      end
    end

    it "should render show with public activity" do
      activity = create(:public_activity)

      get :show, :id => activity.receiver.to_param

      response.should be_success
      response.body.should =~ /activity_#{ activity.id }/
    end

    it "should not render edit" do
      begin
        get :edit, :id => create(:user).to_param

        assert false
      rescue CanCan::AccessDenied 
        assert true
      end
    end
  end

  describe "when authenticated" do
    before do
      @user = create(:friend, :receiver => create(:group).actor).sender_subject

      sign_in @user
    end

    it "should render index" do
      get :index

      assert_response :success
    end

    it "should render self page" do
      get :show, :id => @user.to_param

      assert_response :success
    end

    it "should render other's page" do
      get :show, :id => create(:user).to_param

      assert_response :success
    end

    it "should render other's page with activity" do
      tie = create(:friend, :receiver => @user.actor)
      friend = tie.sender
      create(:post, :_contact_id  => tie.contact_id,
                     :_relation_ids => Array(tie.relation_id))

      get :show, :id => friend.to_param

      response.should be_success
    end

    it "should not render other's edit" do
      begin
        get :edit, :id => create(:user).to_param

        assert false
      rescue CanCan::AccessDenied 
        assert true
      end
    end
  end
end

