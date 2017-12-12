require 'spec_helper'

describe '#test' do
class String
  def palindrome?
    self == self.reverse
  end
end
end
