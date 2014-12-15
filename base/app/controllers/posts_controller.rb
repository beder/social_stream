class PostsController < InheritedResources::Base
  load_and_authorize_resource

  respond_to :html, :xml, :js

  def destroy
    @post_activity = resource.post_activity

    destroy!
  end

  protected
  
  def permitted_params
    params.permit(:post => [:_contact_id, :text, {:_relation_ids=>[]}])
  end
end
