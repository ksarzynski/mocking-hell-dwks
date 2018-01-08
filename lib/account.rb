class Account
  attr_accessor :id, :login, :password, :employee

  def initialize(id, login, password, employee)
    @id = id
    @login = login
    @password = password
    @employee = employee
  end

  def to_s
    "#{login} ; #{password} ; #{employee}"
  end
end
