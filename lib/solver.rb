# frozen_string_literal: true

require 'set'

class Solver
  STEPS = [1, -1].freeze

  def initialize(initial_state:, target_state:, restricted_combinations:)
    @initial_state = initial_state
    @target_state = target_state
    @restricted_combinations = restricted_combinations.to_set
  end

  def find_path
    return [] if target?(@initial_state)

    process_queue
  end

  private

  def process_queue
    setup_initial_state
    until @queue.empty?
      current_state, path = @queue.shift

      neighbors(current_state).each do |next_state|
        next if invalid_state?(next_state)
        return path + [next_state] if target?(next_state)

        process_state(next_state, path)
      end
    end

    nil
  end

  def invalid_state?(state)
    @visited.include?(state) || @restricted_combinations.include?(state)
  end

  def target?(state)
    state == @target_state
  end

  def process_state(state, path)
    @queue << [state, path + [state]]
    @visited << state
  end

  def setup_initial_state
    @queue = [[@initial_state, [@initial_state]]]
    @visited = Set.new([@initial_state])
  end

  def neighbors(state)
    neighbors = []

    state.each_with_index do |digit, i|
      STEPS.each do |step|
        new_state = state.dup
        new_state[i] = (digit + step) % 10
        neighbors << new_state
      end
    end

    neighbors
  end
end
