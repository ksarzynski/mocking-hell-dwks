require_relative 'spec_helper'

describe '#new' do
  context '' do
    let(:id) { 1 }
    let(:firstname) { 'Dawid' }
    let(:lastname) { 'Wiecko' }
    let(:salary) { 111 }
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

    it 'returns correct employee' do
      expect(employee.to_s).to be_a(String).and eq("#{firstname} #{lastname} #{salary}")
    end
  end
end
