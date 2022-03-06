Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get '/about' => 'pages#about'
  
  resources :users do
    resource :profile do
      resources :educations
      resources :experiences
      resources :projects
      resources :certificates
      get '/del-img' => 'profiles#del_img'
    end
  end

end
