BikeBike::Application.routes.draw do

	#resources :events
	#resources :event_types
	#resources :workshop_requested_resources
	#resources :workshop_facilitators
	#resources :registration_form_fields

  resources :conferences, :only => :index
  resources :conferences, :param => :slug, :path => 'conferences/:conference_type' do

    match 'register(/:step)' => 'conferences#register', via: [:get, :post]
    get 'register/confirm/:confirmation_token' => 'conferences#register_confirm'
    match 'register/pay-registration/:confirmation_token' => 'conferences#register_pay_registration', via: [:get, :post]
    get 'register/paypal-confirm/:confirmation_token' => 'conferences#register_paypal_confirm'
    get 'register/paypal-cancel/:confirmation_token' => 'conferences#register_paypal_cancel'
    get 'registrations' => 'conferences#registrations'
  end

  resources :organizations, :param => 'slug' do
    get :members
    get :identity
    get :json
    post :nonmembers
  end

  resources :users, :except => [:new, :index, :destroy] 
  get	'register', to: 'users#new', :as => 'register'

  resources :user_sessions, :only => [:create]
  get	'login', to: 'user_sessions#new', :as => :login
  post	'logout', to: 'user_sessions#destroy', :as => :logout



	#resources :workshop_streams
	#resources :workshop_resources
	#resources :workshop_presentation_styles

	#resources :locations

	post '/translate/' => 'pages#translate'
	post '/location/territories/' => 'pages#location_territories'
	
	get '/translations/:lang', to: 'pages#translations'
	get '/translations', to: 'pages#translation_list'

  
	post "oauth/callback" => "oauths#callback"
	get "oauth/callback" => "oauths#callback"
	get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider

    get 'robots.txt' => 'pages#robots'
    get 'resources' => 'pages#resources'

	root 'pages#home'

end
