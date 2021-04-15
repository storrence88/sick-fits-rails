# frozen_string_literal: true

module Types
  class ProductType < Types::BaseObject
    field :id,          ID, null: false
    field :name,        String, null: false
    field :description, String, null: false
    field :status,      String, null: false
    field :price,       Integer, null: false
    field :user,        Types::UserType, null: false
    field :created_at,  GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at,  GraphQL::Types::ISO8601DateTime, null: false
  end
end
