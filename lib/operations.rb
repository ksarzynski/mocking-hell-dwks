class Operations
  attr_accessor :employee, :accounts, :projects, :developments

  @@employee = []
  @@accounts = []
  @@projects = []
  @@developments = []

  def listOfEmployees
    puts 'Pracownicy:'
    i = 0
    while i < @@employee.size
      show_employee(i)
      i += 1
    end
end

  def create_sample_development
    Development.new(0, @@accounts[0], @@projects[0])
    Development.new(1, @@accounts[0], @@projects[1])

    Development.new(0, @@accounts[1], @@projects[2])
    Development.new(1, @@accounts[1], @@projects[3])
  end
  
  def add_employee(firstname, lastname, salary)
    size = @@employee.size
    id = 0
    id += 1 while id < size && !@@employee[id].nil?
    employee = Employee.new(id, firstname, lastname, salary)
    @@employee.insert(id, employee)
    puts "Dodano nowego pracownika do bazy:
    id - #{@@employee[id].id},
    firstname - #{@@employee[id].firstname},
    lastname - #{@@employee[id].lastname},
    salary - #{@@employee[id].salary.to_f}."
  end

  def show_employee(id)
    if !@@employee.at(id).nil?
      puts "Pracownik o ID = #{@@employee[id].id}: #{@@employee[id]}"
    else
      puts "Pracownik o ID = #{id} nie istnieje w bazie."
    end
  end

  def edit_employee(id, firstname, lastname, salary)
    if !@@employee.at(id).nil?
      insert_data_edit_employee(id, firstname, lastname, salary)
      puts "Edytowano pracownika o ID = #{@@employee[id].id}."
    else
      puts "Pracownik o ID = #{id} nie istnieje w bazie."
    end
  end

  def insert_data_edit_employee(id, firstname, lastname, salary)
    @@employee[id].firstname = firstname if firstname != ''
    @@employee[id].lastname = lastname if lastname != ''
    @@employee[id].salary = salary if salary != 0
  end

  def remove_employee(id)
    if !@@employee.at(id).nil?
      @@employee[id] = nil
      puts "Usunięto pracownika o ID = #{id}."
    else
      puts "Pracownik o ID = #{id} nie istnieje w bazie."
    end
  end

  def add_account(login, password)
    employee = @@employee.size
    size = @@accounts.size
    id = 0
    id += 1 while id < size && !@@accounts[id].nil?
    account = Account.new(id, login, password, employee)
    @@accounts.insert(id, account)
    puts "Dodano nowe konto:
    login - #{login},
    hasło - #{password}."
  end

  def listOfAccounts
    puts 'Konta:'
    i = 0
    while i < @@accounts.size
      show_account(i)
      i += 1
    end
end

  def show_account(id)
    if !@@accounts.at(id).nil?
      puts "Konto o ID = #{id}: #{@@accounts[id]}"
    else
      puts "Konto o ID = #{id} nie istnieje w bazie."
    end
  end

  def edit_login_password(id, login, password)
    @@accounts[id].login = login if login != ''
    @@accounts[id].password = password if password != ''
  end

  def edit_account(id, login, password)
    if !@@accounts.at(id).nil?
      @@accounts[id].employee = @@people[id]
      edit_login_password(id, login, password)
      puts "Edytowno konto o ID = #{id}."
    else
      puts "Konto o ID = #{id} nie istnieje w bazie"
    end
  end

  def remove_account(id)
    if !@@accounts.at(id).nil?
      @@accounts[id] = nil
      remove_employee(id)
      puts "Usunięto konto o ID = #{id}."
    else
      puts "Konto o ID = #{id} nie istnieje w bazie."
    end
  end

  def add_project(name, date, deadlinedate)
    size = @@projects.size
    id = 0
    id += 1 while id < size && !@@projects[id].nil?
    project = Project.new(id, name, date, deadlinedate)
    @@projects.insert(id, project)
    puts "Dodano nowy projekt:
    ID - #{id} ,
    Nazwa - #{name},
    Data rozpoczęcia - #{date},
    Data zakończenia - #{deadlinedate}."
  end

  def insert_data_edit_project(id, name, date, deadlinedate)
    @@projects[id].name = name unless name.nil?
    @@projects[id].date = date if date != ''
    @@projects[id].deadlinedate = deadlinedate if deadlinedate != ''
  end

  def edit_project(id, name, date, deadlinedate)
    if !@@projects.at(id).nil?
      insert_data_edit_project(id, name, date, deadlinedate)
      puts "Edytowano projekt o ID = #{id}."
    else
      puts "Projekt o ID = #{id} nie istnieje w bazie"
    end
  end

  def show_project(id)
    if !@@projects.at(id).nil?
      puts "Projekt o ID = #{id}:
      Nazwa = #{@@projects[id].name} ,
      Data rozpoczęcia = #{@@projects[id].date} ,
      Data zakończenia = #{@@projects[id].deadlinedate}."
    else
      puts "Projekt o ID = #{id} nie istnieje w bazie."
    end
  end

  def remove_project(id)
    if !@@projects.at(id).nil?
      @@projects[id] = nil
      puts "Usunięto projekt o ID = #{id}."
    else
      puts "Projekt o ID = #{id} nie istnieje w bazie."
    end
  end

  def add_developments(account_id, project_id)
    id = 0
    id += 1 while id < @@projects.size && !@@developments[id].nil?
    if !@@accounts[account_id].nil? && !@@projects[project_id].nil?
      project = Development.new(id, @@accounts[account_id], @@projects[project_id])
      @@project.insert(id, project)
      puts "Dodano nowy projekt o ID => #{@@project[id].id}."
    else
      puts 'Błąd przy dodawaniu. Nie odnaleziono danych o podanym id'
    end
  end

  def show_all_developments
    puts 'Statystyki:'
    i = 0
    while i < @@developments.size
      puts "Dane projektu o ID => #{@@developments[i].id}: #{@@developments[i]}" unless @@developments.at(i).nil?
      i += 1
    end
  end
end
