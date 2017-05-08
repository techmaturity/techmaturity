Rails.application.routes.draw do

	root :to => 'static#dashboard'

	get '/docs' => 'static#docs'
	get '/about' => 'static#about'
	get '/contact' => 'static#contact'
	post '/feedback' => 'static#send_to_slack'

	get '/github', to: redirect('https://github.com/Ticketmaster/techmaturity.git')

	resources :products do
		resources :scores, except: [:destroy, :update, :edit]
		resources :tags
	end

	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
