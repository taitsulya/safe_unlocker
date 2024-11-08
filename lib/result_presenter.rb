# frozen_string_literal: true

class ResultPresenter
  def initialize(result:)
    @result = result
  end

  def present
    return 'The target state cannot be reached' if @result.nil?
    return 'The initial state if the target state' if @result.empty?

    "Combinations to reach the target state:\n#{@result}"
  end
end
