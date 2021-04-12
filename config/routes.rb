require 'sidekiq/web'

Rails.application.routes.draw do
  mount_graphql_devise_for 'User', at: 'graphql_auth'
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  mount Sidekiq::Web => '/sidekiq'
  post "/graphql", to: "graphql#execute"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
