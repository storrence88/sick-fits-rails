# frozen_string_literal: true

module Mutations
  module Users
    class Base < Mutations::BaseMutation
      null true

      private

      # Return and memoize the User by user_id
      def user
        @user ||= ::User.find_by(id: user_id)
      end

      # Get the user id from the mutation arguments
      def user_id
        instance_variable_get(:@prepared_arguments).dig(:user_id)
      end
    end
  end
end
