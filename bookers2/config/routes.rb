Rails.application.routes.draw do

  devise_for :users
  root to: "homes#top"
  resources :books,only:[:new,:index,:show,:create,:destroy,:update,:edit]

  resources :users,only:[:show,:edit,:update,:index]
  post "/users/:id" => "books#create"
  patch "books/:id/edit"=>"books#update"
  get "/home/about",to:"homes#about",as:"about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
