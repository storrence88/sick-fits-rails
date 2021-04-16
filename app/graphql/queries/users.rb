# frozen_string_literal: true

module Queries
  module Users
    extend ActiveSupport::Concern

    included do
      field :current_user, Types::UserType, null: true

      field :user, Types::UserType, null: true do
        argument :attributes, Types::Attributes::UserAttributes, required: true
      end

      field :users, Types::UserType.connection_type, null: true

      field :products, [Types::ProductType], null: true
    end

    # Resolver for current_user field
    # @return [Object] the current user set by token
    def current_user
      context[:current_user] || context[:controller].current_user
    end

    # Resolver for users field
    # @return [Object] of all users in the DB
    def users
      User.all
    end
  end
end
