Rails.application.routes.draw do

  # Static Routes 
  root :to => 'static#dashboard'
  get '/docs' => 'static#docs'
  get '/about' => 'static#about'
  get '/contact' => 'static#contact'
  post '/feedback' => 'static#send_to_slack'

  # Dump Endpoint
  get 'dump' => 'dump#dump'

  # External Endpoints 
  get '/github', to: redirect('https://github.com/Ticketmaster/techmaturity.git')

  # Restful resources
  resources :products do
    resources :scores, except: [:destroy, :update, :edit]
    resources :tags, except: [:index, :show]
  end

end
