require 'sidekiq/web'

Rails.application.routes.draw do
  mount_graphql_devise_for 'User', at: 'graphql_auth'
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  mount Sidekiq::Web => '/sidekiq'
  post "/graphql", to: "graphql#execute"
end
