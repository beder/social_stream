require 'spec_helper'

describe Actor do
  it "should generate slug" do
    assert create(:user).actor.slug.present?
  end

  it "should generate different slug" do
    a = create(:user).actor
    b = create(:user, :name => a.name).actor

    a.name.should == b.name
    a.slug.should_not == b.slug
  end

  it "should generate relations" do
    assert create(:user).relation_customs.present?
  end

  context 'pending contacts' do
    it 'should not include self' do
      a = create(:user).actor
      c = a.contact_to!(a)

      a.pending_contacts.should_not include(c)
    end
  end

  it 'should generate suggestion' do
    10.times do
      create(:user)
    end

    sgs = create(:user).suggestions(5)

    sgs.size.should be(5)

    sgs_names = sgs.map{ |s| s.receiver_subject.name }.compact

    sgs.size.should be(5)
  end

  it "should be destroyed" do
    u = create(:user)
    a = u.actor

    u.destroy

    expect(Actor.where(id: a.id).first).to be_nil
  end

  it "should destroy the user" do
    u = create(:user)
    a = u.actor

    a.destroy

    expect(User.where(id: u.id).first).to be_nil
  end
end
