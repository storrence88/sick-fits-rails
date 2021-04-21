# frozen_string_literal: true

module Strategies
  class GraphqlAttributesFor
    def association(runner)
      runner.run(:null)
    end

    # Generates a hash of attributes with camelCased keys for a registered factory by name.
    # @return [Hash] hash of attributes for the factory
    def result(evaluation)
      evaluation.hash.each_with_object({}) { |(k, v), obj| obj[k.to_s.camelize(:lower).to_sym] = v  }
    end
  end
end
