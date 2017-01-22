Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  root 'home#main'
  get '/mypage' => 'home#mypage'
  get '/write' => 'home#write'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
