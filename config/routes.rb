Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#home"
  post 'posts/sort_by_date', to: 'posts#sort_by_date', as: :sort_by_date

  resources :posts
  get '/users/:id/posts', to: 'posts#my_posts', as: :my_posts
  post 'posts/:id/mark', to: 'posts#mark', as: :mark
  delete 'posts/:id/mark', to: 'posts#unmark', as: :unmark
  get '/users/:id/marked', to: 'posts#marked_post', as: :marked_posts
end
