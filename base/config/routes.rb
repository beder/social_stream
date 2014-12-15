Rails.application.routes.draw do
  
  root :to => "frontpage#index"
  
  get 'home' => 'home#index', :as => :home
  get 'home' => 'home#index', :as => :user_root # devise after_sign_in_path_for
  
  # Webfinger
  get '.well-known/host-meta',:to => 'frontpage#host_meta'
  
  # Social Stream subjects configured in config/initializers/social_stream.rb
  SocialStream.subjects.each do |actor|
    localized do
      resources actor.to_s.pluralize do
        resource :like
        resource :profile
        resources :activities
      end
    end
  end

  resources :contacts do
    collection do
      get 'pending'
    end
  end

  namespace "relation" do
    resources :customs
  end
  resources :permissions

  get 'tags'     => 'tags#index', :as => 'tags'
  
  # Find subjects by slug
  get 'subjects/lrdd/:id' => 'subjects#lrdd', :as => 'subject_lrdd'
  
  resource :representation
  
  resources :settings do
    collection do
      put 'update_all'
    end
  end

  resources :messages

  resources :conversations

  resources :invitations
  
  resources :notifications do
    collection do
      put 'update_all'
    end
  end

  resources :comments

  resources :activities do
    resource :like
  end
  
  get 'search' => 'search#index', :as => :search  
  
  get 'ties' => 'ties#index', :as => :ties
  
  # Social Stream objects configured in config/initializers/social_stream.rb
  (SocialStream.objects - [ :actor ]).each do |object|
    resources object.to_s.pluralize
  end
  
  ##API###
  get 'api/keygen' => 'api#create_key', :as => :api_keygen
  get 'api/user/:id' => 'api#users', :as => :api_user
  get 'api/me' => 'api#users', :as => :api_me
  get 'api/me/home/' => 'api#activity_atom_feed', :format => 'atom', :as => :api_my_home
  get 'api/me/contacts' => 'contacts#index', :format => 'json', :as => :api_contacts
  get 'api/subjects/:s/contacts' => 'contacts#index', :format => 'json', :as => :api_subject_contacts
  get 'api/user/:id/public' => 'api#activity_atom_feed', :format => 'atom', :as => :api_user_activities
  ##/API##
end
