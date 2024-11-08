# frozen_string_literal: true

require_relative 'solver'
require_relative 'validators/input_validator'

class SafeUnlocker
  def initialize(combination_size:, initial_state:, target_state:, restricted_combinations:)
    @combination_size = combination_size
    @initial_state = initial_state
    @target_state = target_state
    @restricted_combinations = restricted_combinations
  end

  def opening_combinations
    validate!
    solve
  end

  private

  def solve
    Solver.new(
      initial_state: @initial_state, target_state: @target_state, restricted_combinations: @restricted_combinations
    ).find_path
  end

  def validate!
    Validators::InputValidator.new(
      combination_size: @combination_size, initial_state: @initial_state, target_state: @target_state,
      restricted_combinations: @restricted_combinations
    ).validate!
  end
end
