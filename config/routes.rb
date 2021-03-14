Rails.application.routes.draw do
  root 'sessions#home'

 #Custom
 get '/signup' => 'users#new'
 post '/signup' => 'users#create' #optional, 'post to create' is built in to the default . If using FormFor, that would be the default submission. However if the user signed-up incorrectly and you wanted to re-route them to back and want the url to still say /signup, then you might want the custom route

 #Login Route
 get '/login' => 'sessions#new'
 post '/login' => 'sessions#create'

 #Logout Route
 delete '/logout' => 'sessions#destroy'

 #Built-in
  resources :users


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
