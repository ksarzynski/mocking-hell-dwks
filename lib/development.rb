class Development
  attr_accessor :id, :account, :project

  def initialize(id, account, project)
    @id = id
    @account = account
    @project = project
  end

  def to_s
    "#{account.login} - #{project}"
  end
end
