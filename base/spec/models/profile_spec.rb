require 'spec_helper'

describe Profile do
  context "belonging to a user" do
    before do
      @profile = create(:user).profile
    end

    context "accessed by her" do
      before do
        @ability = Ability.new(@profile.subject)
      end

      it "should allow read" do
        @ability.should be_able_to(:read, @profile)
      end

      it "should allow update" do
        @ability.should be_able_to(:update, @profile)
      end
    end

    context "accessed by other" do
      before do
        u = create(:user)
        @ability = Ability.new(u)
      end

      it "should allow read" do
        @ability.should be_able_to(:read, @profile)
      end

      it "should deny update" do
        @ability.should_not be_able_to(:update, @profile)
      end
    end

  end
end
