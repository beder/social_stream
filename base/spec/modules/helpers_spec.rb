require 'spec_helper'

class DummyController < ::ActionController::Base
end

describe "SocialStream::Controllers::Helpers" do
  
  before do
    @controller = DummyController.new
  end
  describe "current_ability" do
    it "should be defined" do      
      @controller.should respond_to(:current_ability)
    end

    it "should return an ability model" do  
      @controller.stub(:current_subject){ nil }
      @controller.current_ability.should be_instance_of(::Ability)
    end
  end

end