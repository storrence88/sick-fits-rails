# frozen_string_literal: true

module GraphqlDeviseAuth
  def login(user)
    user&.create_new_auth_token
    allow(controller_context).to receive(:current_user) { user }
    allow(controller_context).to receive(:set_user_by_token) { user }
    allow(controller_context).to receive(:token) { OpenStruct.new(client: user&.tokens&.keys&.last) }
  end
end
