Rails.application.routes.draw do
  resources :posts
  resources :links do
    member do
      put "like", to: "posts#upvote"
      put "dislike", to: "posts#downvote"
    end
  end
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users

  root 'home#main'
  get '/mypage' => 'home#mypage'
  get '/write' => 'posts#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
