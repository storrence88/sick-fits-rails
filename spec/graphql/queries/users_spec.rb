# frozen_string_literal: true

require 'rails_helper'

describe Queries::Users, type: :graphql do
  Sidekiq::Testing.inline!
  include_context 'GraphQL Devise'

  let(:context) do
    {
      controller: controller_context,
      current_user: user
    }
  end

  describe '.users' do
    let(:query) do
      %|
        query {
          users {
            nodes {
              id
              firstName
              lastName
            }
          }
        }
      |
    end

    context 'when authenticated' do
      let(:user) { create :user }

      # before { login(user) }

      it 'returns users attributes' do
        expect(result.dig('data', 'users')).not_to be_falsey
        expect(result.dig('data', 'users', 'nodes')).not_to be_falsey
        expect(result.dig('data', 'users', 'nodes', 0, 'id')).not_to be_falsey
        expect(result.dig('data', 'users', 'nodes', 0, 'firstName')).not_to be_falsey
        expect(result.dig('data', 'users', 'nodes', 0, 'lastName')).not_to be_falsey
      end

      # describe 'pagination' do
      #   let(:query) do
      #     %|
      #     query($size: Int, $page: Int, $searchTerm: String) {
      #       users(
      #         search: {
      #           size: $size,
      #           page: $page,
      #           searchTerm: $searchTerm
      #         }
      #       ) {
      #         nodes {
      #           id
      #         }
      #         pageInfo {
      #           hasNextPage
      #           startCursor
      #           endCursor
      #           hasPreviousPage
      #         }
      #       }
      #     }
      #     |
      #   end
      #   let(:variables) do
      #     {
      #       size: size,
      #       page: page,
      #       searchTerm: search_term
      #     }
      #   end
      #   let(:size) { 2 }
      #   let(:search_term) { 'Hello Wo' }
      #   let(:users) { create_list :admin, 10, first_name: 'Hello', last_name: 'World' }
      #   before { users && ElasticIndexer.refresh }

      #   describe 'first page' do
      #     let(:page) { 1 }

      #     it 'returns hasNextPage ture and hasPreviousPage false' do
      #       expect(result.dig('data', 'users', 'pageInfo', 'hasNextPage')).to be_truthy
      #       expect(result.dig('data', 'users', 'pageInfo', 'hasPreviousPage')).to be_falsey
      #     end
      #   end

      #   describe 'page 2' do
      #     let(:page) { 2 }

      #     it 'returns hasNextPage and hasPreviousPage both true' do
      #       expect(result.dig('data', 'users', 'pageInfo', 'hasNextPage')).to be_truthy
      #       expect(result.dig('data', 'users', 'pageInfo', 'hasPreviousPage')).to be_truthy
      #     end
      #   end

      #   describe 'last page' do
      #     let(:page) { 5 }

      #     it 'returns hasNextPage false and hasPreviousPage true' do
      #       expect(result.dig('data', 'users', 'pageInfo', 'hasNextPage')).to be_falsey
      #       expect(result.dig('data', 'users', 'pageInfo', 'hasPreviousPage')).to be_truthy
      #     end
      #   end
      # end
    end
  end
end
