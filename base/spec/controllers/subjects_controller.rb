require 'spec_helper'

describe SubjectsController do
  render_views

  it "should redirect lrdd" do
    @user = create(:user)

    get :lrdd, :id => "#{ @user.slug }@test.host"

    response.should redirect_to(user_path(@user, :format => :xrd))
  end
end

