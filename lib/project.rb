class Project
  attr_accessor :id, :name, :date, :deadlinedate

  def initialize(id, name, date, deadlinedate)
    @id = id
    @name = name
    @date = date
    @deadlinedate = deadlinedate
  end

  def to_s
    "#{name} - #{date} - #{deadlinedate}"
  end
end
