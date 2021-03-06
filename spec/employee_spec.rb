require_relative 'spec_helper'

RSpec.describe 'Employee' do
context '#new' do
    let(:id) { 1 }
    let(:firstname) { 'Dawid' }
    let(:lastname) { 'Wiecko' }
    let(:salary) { 111.00 }
    subject(:employee) { Employee.new id, firstname, lastname, salary }

    it 'creates a new employee' do
      expect { employee }.not_to raise_error
    end
    it 'returns Employee type' do
      allow(employee).to receive(:kind_of?).and_return(Employee)
      expect(employee).to be_a_kind_of(Employee)
    end

    it 'returns correct id' do
      expect(employee.id).to eq(id)
    end

    it 'returns correct firstname' do
      expect(employee.firstname).to eq(firstname)
    end

    it 'returns correct lastname' do
      expect(employee.lastname).to eq(lastname)
    end
    it 'returns correct salary' do
      expect(employee.salary).to eq(salary)
    end
end
context '#to_s' do
    let(:id) { 1 }
    let(:firstname) { double('firstname', firstname: 'Dawid') }
    let(:lastname) { double('lastname', lastname: 'Wiecko') }
    let(:salary)   { double('salary', salary: 1200.00) }
    subject(:employee) { Employee.new id, firstname, lastname, salary }
    
    it 'returns correct employee' do
      expect(employee.to_s).to be_a(String).and include(firstname.to_s, lastname.to_s, salary.to_s)
    end
  end
end
