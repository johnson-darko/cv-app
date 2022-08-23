Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
resources :resumes do
  resources :educations

end
  # Defines the root path route ("/")
  # root "articles#index"
  root 'resumes#index'
end
