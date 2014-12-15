FactoryGirl.define do

  factory :picture do
    file { Rack::Test::UploadedFile.new(File.join(File.dirname(__FILE__), 'files', 'rails.png'),
                                         'image/png') }

    _contact_id { create(:friend).contact_id }
    _relation_ids { |q| Array(Contact.find(q._contact_id).sender.relation_customs.sort.first.id) }

    factory :public_picture, :parent => :picture do
      _contact_id { create(:self_contact).id }
      _relation_ids { |q| Array(Contact.find(q._contact_id).sender.relation_public.id) }
    end

    factory :private_picture, :parent => :picture do
      file { Rack::Test::UploadedFile.new(File.join(File.dirname(__FILE__), 'files', 'privado.png'),
                                           'image/png') }
      _contact_id { create(:self_contact).id }
      _relation_ids { |q| Array(Contact.find(q._contact_id).sender.relation_customs.sort.first.id) }
    end
  end


end

