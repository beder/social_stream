class ProfilesController < InheritedResources::Base
  load_objects_for :profile
  
  defaults :singleton => true
  SocialStream.subjects.each do |subj|
    belongs_to subj, { :polymorphic => true, :finder => :find_by_slug!, :singleton => true }
  end
    
  SocialStream.subjects.each do |subj|
    authorize_resource :profile,
                       :through => subj,
                       :singleton => true
  end
  
  respond_to :html, :xml, :js

  protected
    
  def permitted_params
    params.permit(:profile => [ {:actor=>[:tag_list, :name]}, :organization, :birthday, :city, :country, :description, :phone, :mobile, :fax, :address, :website, :experience])
  end
end
