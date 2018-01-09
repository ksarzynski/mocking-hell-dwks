require_relative 'project'
require_relative 'operations'
require_relative 'development'
require_relative 'account'
require_relative 'employee'

class Program
  def initialize
    puts "Start programu"
    @program = Operations.new
    start
    menu_action
  end

  def menu_action
    loop do
      menu
      input = gets.chomp
      case input
      when '1'
        employees_submenu
        case gets.chomp
        when '1'
          @program.listOfEmployees
        when '2'
          edit_employee_action
        when '3'
          remove_employee_action
        when '4'
          addEmployees_submenu
        else
          command_not_found
        end
      when '2'
        activity_submenu
        case gets.chomp
        when '1'
          show_project_action
        when '2'
          remove_project_action
        else
          command_not_found
        end
      when '3'
        accounts_submenu
        choice = gets.chomp
        acoounts_choice(choice)
      end
      break if input.chomp == '4'
    end
  end

  def remove_project_action
    puts 'Wprowadz ID projektu do usuniecia:'
    id = gets.chomp
    @program.remove_account(id.to_i)
    next_step
    gets.chomp
  end

  def acoounts_choice(parameter) 
    case parameter
    when '1'
    @program.listOfAccounts 
    when '2'
    edit_account_action
    when '3'
    remove_account_action
    else 
      command_not_found
    end
  end

  def show_project_action
    puts 'Wprowadz ID projektu:'
    id = gets.chomp
    @program.show_project(id.to_i)
    next_step
    gets.chomp
  end

  def remove_employee_action
    puts 'Wprowadz ID pracownika do usuniecia:'
    id = gets.chomp
    @program.remove_employee(id.to_i)
    next_step
    gets.chomp
  end

  def edit_employee_action
    puts 'Wprowadz ID pracownika do edycji:'
    id = gets.chomp
    puts 'Podaj imie:'
    name = gets.chomp
    puts 'Podaj nazwisko:'
    lastname = gets.chomp
    puts 'Podaj pensje:'
    salary = gets.chomp
    @program.edit_employee(id, name, lastname,salary)
    next_step
    gets.chomp
  end

  def command_not_found
    puts 'Nie rozpoznano komendy'
  end

  def employees_submenu
    puts '    1 : Pokaz wszystkich'
    puts '    2 : Edytuj pracownika'
    puts '    3 : Usun pracownika'
    puts '    4 : Dodaj pracownika'
  end

  def addEmployees_submenu
    puts ' Podaj imie '
    name = gets.chomp
    puts ' Podaj nazwisko '
    surname = gets.chomp
    puts ' Podaj pensje '
    salary = gets.chomp
    puts ' Podaj login'
    login = gets.chomp
    puts ' Podaj haslo'
    password = gets.chomp

    @program.add_employee(name, surname, salary)
    @program.add_account(login, password)
  end

  def edit_account_action
    puts 'Wprowadz ID konta do edycji:'
    id = gets.chomp
    puts 'Podaj login:'
    login = gets.chomp
    puts 'Podaj haslo:'
    password = gets.chomp
    @program.edit_employee(id, login, password)
    next_step
    gets.chomp
  end

  def remove_account_action
    puts 'Podaj id:'
    id = gets.chomp
    @program.remove_employee(id)
    next_step
    gets.chomp
  end

  def accounts_submenu
    puts '    1 : Pokaz wszystkich'
    puts '    2 : Edytuj konto'
    puts '    3 : Usun konto'
  end

    def activity_submenu
    puts '    1 : Pokaz szczegoly'
    puts '    2 : Edytuj projekt'
    puts '    3 : Usun projekt'
  end

  def next_step
    puts 'Co chcesz teraz zrobic?'
  end

  def menu
    puts '****     Baza danych pracownikow firmy IT     ***'
    puts '1 : Pracownicy'
    puts '2 : Projekty'
    puts '3 : Konta'
    puts '4 : Koniec'
  end

  def add_sample_employees
    @program.add_employee('Dawid', 'Wiecko', 1200.00)
    @program.add_employee('Kamil', 'Sarzynski', 1200.00)
  end

  def add_sample_project
    @program.add_project('Intel','2018-01-03 00:00:00', '2018-01-05 00:00:00')
    @program.add_project('IBM','2018-01-04 00:00:00', '2018-01-05 00:00:00')
    @program.add_project('Intel','2018-01-02 00:00:00', '2018-01-07 00:00:00')
    @program.add_project('IBM','2018-01-01 00:00:00', '2018-01-10 00:00:00')
  end

  def create_sample_account
    @program.add_account('dwiecko', 'haslo123' )
    @program.add_account('ksarzynski', 'password')
  end
  
  def start
   add_sample_employees
   create_sample_account
   add_sample_project
   @program.create_sample_development
  end
end
