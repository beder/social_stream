require 'spec_helper'

describe GroupsController do
  include SocialStream::TestHelpers::Controllers

  render_views

  describe "when Anonymous" do
    it "should render index" do
      get :index

      assert_response :success
    end

    it "should render show" do
      get :show, :id => create(:group).to_param

      assert_response :success
    end

    it "should not render new" do
      get :new

      response.should redirect_to(new_user_session_path)
    end

    context "faking a new group" do
      it "should deny creating" do
        post :create, :group => { :name => "Test",
                                  :_contact_id => create(:user).ego_contact.id
                                }

        response.should redirect_to(new_user_session_path)
      end
    end

    context "an existing group" do
      before do
        @current_model = create(:group)
      end

      it_should_behave_like "Deny Updating"
      it_should_behave_like "Deny Destroying"
    end
  end

  describe "when authenticated" do
    before do
      @user = create(:user)

      sign_in @user
    end

    it "should render index" do
      get :index

      assert_response :success
    end

    it "should render contact group" do
      @group = create(:member, :contact => create(:group_contact, :receiver => @user.actor)).sender_subject
      get :show, :id => @group.to_param

      response.should be_success
      response.body.should =~ /activities_share_btn/
    end

    it "should render other group" do
      get :show, :id => create(:group).to_param

      assert_response :success
    end

    it "should render new" do
      get :new

      assert_response :success
    end

    context "a new own group" do
      before do
        model_attributes[:_contact_id] = @user.ego_contact.id
      end

      it "should allow creating" do
        count = Group.count
        post :create, attributes

        group = assigns(:group)

        group.should be_valid
        Group.count.should eq(count + 1)
        assigns(:current_subject).should eq(group)
        response.should redirect_to(:home)
      end

      context "with participants" do
        before do
          @user_participant = create(:user)
          @group_participant = create(:group)

          model_attributes[:_participants] = [@user_participant.actor_id, @group_participant.actor_id]
        end

        it "should allow creating" do
          count = Group.count
          post :create, attributes

          group = assigns(:group)

          group.should be_valid
          Group.count.should eq(count + 1)
          assigns(:current_subject).should eq(group)

          participants = group.contact_subjects(:direction => :sent)

          participants.should include(@user_participant)
          participants.should include(@group_participant)

          group.contact_subjects(:direction => :received)
          response.should redirect_to(:home)
        end
        end
    end

    context "a new fake group" do
      before do
        model_attributes[:_contact_id] = create(:user).ego_contact.id
      end

      it_should_behave_like "Deny Creating"
    end

    context "a external group" do
      before do
        @current_model = create(:group)
      end

      it_should_behave_like "Deny Updating"
      it_should_behave_like "Deny Destroying"
    end


    context "a existing own group" do
      before do
        @current_model = create(:member, :contact => create(:group_contact, :receiver => @user.actor)).sender_subject
      end

      it "should update contact group" do
        put :update, :id => @current_model.to_param,
                     "group" => { "profile_attributes" => { "organization" => "Social Stream" } }

        response.should redirect_to(@current_model)
      end

      # it_should_behave_like "Allow Updating"
      it_should_behave_like "Allow Destroying"
    end
  end
end

