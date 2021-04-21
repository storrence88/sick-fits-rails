# frozen_string_literal: true

require 'rails_helper'

describe Mutations::SignUp, type: :graphql do
  include_context 'GraphQL Devise'

  describe '.userSignUp' do
    let(:query) do
      %|
        mutation userSignUp(
          $email: String!,
          $password: String!,
          $passwordConfirmation: String!,
          $name: String!
        ) {
          userSignUp(
            email: $email,
            password: $password,
            passwordConfirmation: $passwordConfirmation,
            name: $name
          ) {
            user {
              id
              email
              firstName
              lastName
              createdAt
              updatedAt
            }
            credentials {
              accessToken
              client
              uid
              expiry
              tokenType
            }
          }
        }
      |
    end
    let(:variables) { graphql_attributes_for(:user) }

    context 'with valid attributes' do
      describe 'user' do
        it 'creates the user' do
          expect(result.dig('data', 'userSignUp')).not_to be_falsey
          expect(result.dig('data', 'userSignUp', 'user')).not_to be_falsey
          expect(result.dig('data', 'userSignUp', 'user', 'id')).not_to be_falsey
          expect(result.dig('data', 'userSignUp', 'user', 'firstName')).not_to be_falsey
          expect(result.dig('data', 'userSignUp', 'user', 'lastName')).not_to be_falsey
          expect(result.dig('data', 'userSignUp', 'user', 'createdAt')).not_to be_falsey
          expect(result.dig('data', 'userSignUp', 'user', 'updatedAt')).not_to be_falsey
        end
      end

      describe 'credentials' do
        it 'returns authorization tokens' do
          expect(result.dig('data', 'userSignUp')).not_to be_falsey
          expect(result.dig('data', 'userSignUp', 'credentials')).not_to be_falsey
          expect(result.dig('data', 'userSignUp', 'credentials', 'accessToken')).not_to be_falsey
          expect(result.dig('data', 'userSignUp', 'credentials', 'client')).not_to be_falsey
          expect(result.dig('data', 'userSignUp', 'credentials', 'uid')).not_to be_falsey
          expect(result.dig('data', 'userSignUp', 'credentials', 'expiry')).not_to be_falsey
          expect(result.dig('data', 'userSignUp', 'credentials', 'tokenType')).not_to be_falsey
        end
      end
    end

    describe 'validation errors' do
      context 'when no email' do
        before { variables[:email] = '' }

        it 'renders no email error' do
          expect(result.dig('data', 'userSignUp')).to be_falsey
          expect(result.dig('errors')).not_to be_falsey
          expect(result.dig('errors').first.dig(:extensions, :detailed_errors)).to include "Email can't be blank"
        end
      end
    end
  end
end
