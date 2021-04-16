# frozen_string_literal: true

module Mutations
  class SignUp < GraphqlDevise::Mutations::SignUp
    argument :name, String, required: true

    field :user, Types::UserType, null: true

    # SignUp Mutation
    # @return UserSignupPayload
    def resolve(**attrs)
      payload = super
      payload.merge(user: payload[:authenticatable])
    end
  end
end
