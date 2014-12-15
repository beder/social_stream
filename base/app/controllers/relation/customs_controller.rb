class Relation::CustomsController < InheritedResources::Base
  before_filter :authenticate_user!
  load_and_authorize_resource :class => Relation::Custom

  respond_to :html, :js
  
  protected
  
  def permitted_params
    params.permit(:custom => [ :actor_id, :name ], :relation_custom => [ :actor_id, :name ] )
  end
end
