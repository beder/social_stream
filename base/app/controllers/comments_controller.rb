class CommentsController < InheritedResources::Base
  load_and_authorize_resource

  respond_to :html, :xml, :js

  def destroy
    @post_activity = resource.post_activity

    destroy!
  end
  
  def show    
    parent = resource.post_activity.parent
    redirect_to polymorphic_path(parent.direct_object,:anchor => dom_id(parent))
  end
  
  protected
  
  def permitted_params
    params.permit(:comment => [:_contact_id, :_activity_parent_id, :text])
  end

end
