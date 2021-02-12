Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope(:path_names => { :new => "nueva", :edit => "editar" }) do
    resources :appointments, :path => 'citas'
  end
  get '/auth/:provider/callback' => 'sessions#create'
  get '/auth/failure' => 'sessions#failure'
  get '/logout' => 'sessions#destroy'
  get '/laboratorios/:id' => 'appointments#show'
  get '/laboratorios/:id/:date' => 'appointments#show'
  get '/lista' => 'appointments#list'
  get '/lista/:date' => 'appointments#list'
  root :to => 'appointments#index'
  post '/citas/marcar/:id' => 'appointments#mark'
  #root :to => 'appointments#no'
end
