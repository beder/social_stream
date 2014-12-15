require 'spec_helper'

describe Group do
  it "should save description" do
    g = Group.create(:name => "Test",
                     :description => "Testing description",
                     :_contact_id => create(:user).ego_contact.id)

    g.reload.description.should be_present
  end

  it "should have activity_object" do
    create(:group).activity_object.should be_present
  end

  it "should save tag list" do
    g = create(:group)

    g.tag_list = "bla, ble"
    g.save!

    g.reload.tag_list.should be_present
  end
end

