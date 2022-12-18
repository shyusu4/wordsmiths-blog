Rails.application.routes.draw do
  root to: "users#index"
  get 'users/:id' => 'users#show', as: "user"
  get 'users/:author_id/posts' => 'posts#index', as: "user_posts"
  get 'users/:author_id/posts/:id' => 'posts#show', as: "user_post"
end
