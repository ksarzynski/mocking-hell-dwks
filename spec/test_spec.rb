require_relative '../lib/test'
RSpec.describe 'test' do
class String
  def palindrome?
    self == self.reverse
  end
end
end
