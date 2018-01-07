class Employee

  attr_accessor :id, :firstname, :lastname, :salary

  def initialize(id, firstname, lastname, salary)
    @id = id
    @firstname = firstname
    @lastname = lastname
    @salary = salary
  end
 
  def to_s
    employee = "#{firstname} #{lastname} #{salary}"
    employee
  end
end
