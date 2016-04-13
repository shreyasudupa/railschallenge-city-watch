Rails.application.routes.draw do
#  resources :emergencies
get '/emergencies/new' => 'emergencies#new'
end
