# frozen_string_literal: true

module Validators
  class TargetValidator
    def initialize(target_state:, restricted_combinations:)
      @target_state = target_state
      @restricted_combinations = restricted_combinations
    end

    def validate!
      return unless @restricted_combinations.include?(@target_state)

      raise(ArgumentError, 'The target combination is restricted')
    end
  end
end
