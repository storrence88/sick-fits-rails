# frozen_string_literal: true

RSpec.shared_context 'GraphQL Devise' do
  let(:controller_context) {double('GraphqlController')}
  let(:context) do
    {
      controller: controller_context
    }
  end
  let(:variables) { {} }
  let(:query) { '' }
  let(:result) do
    SickFitsRailsSchema.execute(
      query,
      context: context,
      variables: variables
    )
  end

  before :each do
    allow(controller_context).to receive(:resource_class) { User }
    allow(controller_context).to receive(:response) { OpenStruct.new(headers: {}) }
    allow(controller_context).to receive(:current_user)
    allow(controller_context).to receive(:set_user_by_token)
    allow(controller_context).to receive(:sign_in)
    allow(controller_context).to receive(:resource=)
    allow(controller_context).to receive(:client_id=)
    allow(controller_context).to receive(:token=)
  end
end