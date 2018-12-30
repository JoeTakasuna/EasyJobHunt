Rails.application.routes.draw do
  resources :easyjobhunt
  root "home#welcome"
  
  get "signup" => "users#new"
  post "users/create" => "users#create"
  
  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"
  
  get "top" => "home#top"
  post "top/save" => "home#save"
  post "top/add" => "home#add"
  
  get "help" => "home#help"
  get "rule" => "home#rule"
  get "contact" => "home#contact"
  
  get "" => "home#welcome"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
