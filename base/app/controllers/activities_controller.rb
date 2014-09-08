class ActivitiesController < InheritedResources::Base  
  SocialStream.subjects.each do |subj|
    belongs_to subj, { :polymorphic => true, :finder => :find_by_slug! }
  end
  actions :index

  respond_to :js

  protected

  def collection
    rel = params[:section].to_i if params[:section].present?

    # should be activities.page(params[:page], :count => { :select => 'activity.id', :distinct => true }) but it is not working in Rails 3.0.3 
    @activities ||= association_chain[-1].
                      wall(:profile,
                           :for => current_subject,
                           :relation => rel).
                      page(params[:page])
  end

end
