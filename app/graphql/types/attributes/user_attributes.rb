# frozen_string_literal: true

module Types
  module Attributes
    class UserAttributes < BaseInputObject
      description 'Attributes for creating or updating a User'

      argument :id,         ID, required: false
      argument :email,      String, required: false
      argument :first_name, String, required: false
      argument :last_name,  String, required: false
    end
  end
end
