# frozen_string_literal: true

require_relative 'combination_size_validator'
require_relative 'target_validator'

module Validators
  class InputValidator
    def initialize(combination_size:, initial_state:, target_state:, restricted_combinations:)
      @combination_size = combination_size
      @initial_state = initial_state
      @target_state = target_state
      @restricted_combinations = restricted_combinations
    end

    def validate!
      validate_target_state!
      validate_combination_size!
    end

    private

    def validate_target_state!
      TargetValidator.new(
        target_state: @target_state,
        restricted_combinations: @restricted_combinations
      ).validate!
    end

    def validate_combination_size!
      CombinationSizeValidator.new(
        combination_size: @combination_size,
        combinations: [@initial_state] + [@target_state] + @restricted_combinations
      ).validate!
    end
  end
end
