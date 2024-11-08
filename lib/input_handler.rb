# frozen_string_literal: true

class InputHandler
  INVALID_FORMAT = 'Invalid format. Please try again'

  class << self
    def get_input(message: nil, input_type: nil)
      puts message unless message.nil?

      process_input(value: gets.chomp, input_type: input_type)
    rescue JSON::ParserError, ArgumentError
      puts INVALID_FORMAT
      retry
    end

    def get_multiple_lines_input(finish_input_keyword:, initial_message: nil, message: nil, input_type: nil)
      puts initial_message unless initial_message.nil?

      array_input = []
      loop do
        puts message unless message.nil?

        break if (input = gets.chomp) == finish_input_keyword

        array_input << process_input(value: input, input_type: input_type)
      rescue JSON::ParserError, ArgumentError
        puts INVALID_FORMAT
      end
      array_input
    end

    private

    def process_input(value:, input_type:)
      value = JSON.parse(value)
      raise ArgumentError unless input_type.nil? || value.is_a?(input_type)

      value
    end
  end
end
