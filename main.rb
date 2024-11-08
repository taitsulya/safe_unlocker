# frozen_string_literal: true

require 'json'
require_relative 'lib/input_handler'
require_relative 'lib/safe_unlocker'
require_relative 'lib/result_presenter'

n = InputHandler.get_input(message: 'Enter the combination size (n):', input_type: Integer)
initial_state = InputHandler.get_input(message: 'Enter the initial state (e.g. [0, 0, 0]):', input_type: Array)
target_state = InputHandler.get_input(message: 'Enter the target state (e.g. [1, 1, 1]):', input_type: Array)
restricted_combinations = InputHandler.get_multiple_lines_input(
  initial_message: 'Enter the restricted combinations one by one.', input_type: Array,
  message: 'Enter a combination (e.g., [0, 0, 1]) or type "done" to finish:', finish_input_keyword: 'done'
)

unlocker = SafeUnlocker.new(
  combination_size: n, initial_state: initial_state, target_state: target_state,
  restricted_combinations: restricted_combinations
)

puts ResultPresenter.new(result: unlocker.opening_combinations).present
