# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id,         ID, null: false
    field :email,      String, null: true
    field :first_name, String, null: true
    field :last_name,  String, null: true
    field :products,   [Types::ProductType], null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
