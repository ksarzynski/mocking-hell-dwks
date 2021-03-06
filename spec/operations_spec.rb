require_relative '../lib/operations.rb'
require_relative '../lib/employee.rb'
require_relative '../lib/account.rb'
require_relative '../lib/project.rb'
require_relative '../lib/development.rb'

RSpec.describe 'Operations' do
  subject(:operations) { Operations.new }

  context '#add_employee' do
      it 'correctly adds a new employee' do
        firstname = 'Kamil'
        lastname = 'Sarzynski'
        salary = '1200'
        expect { operations.add_employee(firstname, lastname, salary) }.not_to raise_error
      end
      context '#employee_not_found' do
     it {
       id = 5
       expect { operations.add_employee(id, '', '', '') }.to raise_error
     }
   end
end

    context '#add_account' do
    it 'correctly adds a new account' do
      login = 'ksarzynski'
      password = 'haslo'
      expect { operations.add_account(login, password) }.not_to raise_error
    end
    context '#account_not_found' do
   it {
     id = 5
     expect { operations.add_account(id, '', '', '') }.to raise_error
   }
 end
end

  context '#add_project' do
    it 'correctly adds a new project' do
    name = 'ksarzynski'
    date = Date.parse('2018-01-09')
    deadlinedate = Date.parse('2018-01-09')
   expect { operations.add_project(name, date, deadlinedate) }.not_to raise_error
end
  context '#project_not_found' do
    it {
 id = 5
 expect { operations.add_project(id, '', '', '') }.to raise_error
}
end
end

context '#add_project' do
  it 'correctly adds a new project' do
  name = 'ksarzynski'
  date = Date.parse('2018-01-09')
  deadlinedate = Date.parse('2018-01-09')
 expect { operations.add_project(name, date, deadlinedate) }.not_to raise_error
end
end

context '#add_developments' do
  it 'correctly adds a new developments' do
  account_id = 01
  project_id = 01
  expect { operations.add_developments(account_id, project_id) }.not_to raise_error
end
end

context '#show_employee' do
    it 'correctly shows employee' do
     expect { operations.show_employee(0) }.not_to raise_error
    end
   it 'does not show a employee that does not exist' do
      expect { operations.show_employee(2) }.not_to raise_error
    end
end

context '#show_account' do
    it 'correctly shows account' do
     expect { operations.show_account(0) }.not_to raise_error
    end
   it 'does not show a account that does not exist' do
      expect { operations.show_account(2) }.not_to raise_error
    end
    context '#account_not_found' do
   it {
     id = 5
     expect { operations.show_account(id, '', '', '') }.to raise_error
   }
  end
  end

context '#show_project' do
    it 'correctly shows project' do
     expect { operations.show_project(0) }.not_to raise_error
    end
   it 'does not show a account that does not exist' do
      expect { operations.show_project(2) }.not_to raise_error
    end
    context '#account_not_found' do
   it {
     id = 5
     expect { operations.show_project(id, '', '', '') }.to raise_error
   }
  end
  end

context '#show_all_developments' do
    it 'correctly shows all developments in account' do
      expect { operations.show_all_developments }.not_to raise_error
    end
end

context '#edit_employee' do
   it 'correctly edits employee' do
     expect { operations.edit_employee(0, 'Kamil', 'Sarzynski', '1234') }.not_to raise_error
   end
   it 'does not edit employee that does not exist' do
     expect { operations.edit_employee(7, 'Andrzej', 'Nowak', '1') }.not_to raise_error
   end
end

context '#edit_project' do
   it 'correctly edits project' do
     expect { operations.edit_project(0, 'Projekt', Date.parse('2018-01-06'), Date.parse('2018-01-06')) }.not_to raise_error
   end
   it 'does not edit project that does not exist' do
     expect { operations.edit_project(8, 'Projekt', Date.parse('2018-01-06'), Date.parse('2018-01-06')) }.not_to raise_error
   end
end

context '#remove_employee' do
   it 'correctly removes person' do
     expect { operations.remove_employee(0) }.not_to raise_error
   end
   it 'does not remove employee that does not exist' do
     expect { operations.remove_employee(5) }.not_to raise_error
   end
end

context '#remove_project' do
   it 'correctly removes project' do
     expect { operations.remove_project(0) }.not_to raise_error
   end
   it 'does not remove project that does not exist' do
     expect { operations.remove_project(5) }.not_to raise_error
   end
end

context '#remove_account' do
   it 'correctly removes account' do
     expect { operations.remove_account(0) }.not_to raise_error
   end
   it 'does not remove account that does not exist' do
     expect { operations.remove_account(5) }.not_to raise_error
   end
end

context '#print_list_of_accounts' do
  it 'list of accounts should initialize without errors' do
     expect {operations.listOfAccounts }.not_to raise_error
end
end

context '#print_list_of_employees' do
  it 'list of employees should initialize without errors' do
     expect {operations.listOfEmployees }.not_to raise_error
end
end

context '#create_sample_development' do
  it 'create sample development should initialize without errors' do
     expect {operations.create_sample_development }.not_to raise_error
end
end

context '#insert_data_edit_employee' do
  it 'insert data edit employee should initialize with errors with null values' do
     expect {operations.insert_data_edit_employee(01, '', '', '') }.to raise_error
end
end

context '#edit_login_password' do
  it 'edit login password should initialize without errors' do
     expect {operations.edit_login_password(01, '', '') }.not_to raise_error
end
end

context '#insert_data_edit_project' do
  it 'insert_data_edit_project should initialize without errors' do
     expect {operations.insert_data_edit_project(01, '', '', '') }.not_to raise_error
end
end

context '#edit_account' do
  it 'edit account should initialize without errors' do
       expect {operations.edit_account(01, '', '') }.not_to raise_error
  end
  end

end
