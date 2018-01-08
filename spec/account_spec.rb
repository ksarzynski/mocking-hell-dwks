require_relative '../lib/account.rb'

RSpec.describe 'Account' do
  context '#new' do
    let(:id) { 1 }
    let(:login) { double('Login', login: 'dwiecko') }
    let(:password) { double('Password', password: 'password') }
    let(:employee) { double('employee', id: 1, firstname: 'Dawid', lastname: 'Wiecko', salary: 1200.00) }
    subject(:account) { Account.new id, login, password, employee }

    it 'creates a new account' do
      expect { account }.not_to raise_error
    end

    it 'returns Account type' do
      allow(account).to receive(:kind_of?).and_return(Account)
      expect(account).to be_a_kind_of(Account)
    end

    it 'returns correct id' do
      expect(account.id).to eq(id)
    end

    it 'returns correct login' do
      expect(account.login).to eq(login)
      expect(account.login.to_s).to be_a(String).and include(login.to_s)
    end

    it 'returns correct password' do
      expect(account.password).to eq(password)
      expect(account.password.to_s).to be_a(String).and include(password.to_s)
    end

    it 'returns correct employee' do
      expect(account.employee).to eq(employee)
      allow(employee).to receive(:kind_of?).and_return(employee)
      expect(account.employee).to be_a_kind_of(employee)
      expect(account.employee.to_s).to be_a(String).and include(employee.to_s)
    end
  end
  context '#to_s' do
    let(:id) { 1 }
    let(:login) { double('Login', login: 'dwiecko') }
    let(:password) { double('Password', password: 'password') }
    let(:employee) { double('employee', id: 1, firstname: 'Dawid', lastname: 'Wiecko', salary: 1200.00) }
    subject(:account) { Account.new id, login, password, employee }

    it 'returns correct output' do
      expect(account.to_s).to be_a(String).and include(login.to_s, password.to_s, employee.to_s)
    end
  end
end
