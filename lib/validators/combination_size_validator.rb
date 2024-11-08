# frozen_string_literal: true

module Validators
  class CombinationSizeValidator
    def initialize(combination_size:, combinations:)
      @combination_size = combination_size
      @combinations = combinations
    end

    def validate!
      @combinations.each do |combination|
        next if combination.length == @combination_size

        raise(ArgumentError, "The combination #{combination} has a length other than #{@combination_size}")
      end
    end
  end
end
