require_relative '../lib/development.rb'

RSpec.describe 'Development' do
  context '#new' do
    let(:id) { 1 }
    let(:account) { double('Account', id: 1, login: 'ksarzynski', password: 'kamil', person: double('Person', id: 1, firstname: 'Kamil', lastname: 'Sarzynski', salary: '1000')) }
    let(:project) { double('Project', id: 1, name: 'projekt1', start_date: Date.parse('2018-01-01'), deadline_date: Date.parse('2018-01-05')) }
    subject(:development) { Development.new id, account, project }

    it 'creates a new development object' do
      expect { development }.not_to raise_error
    end

    it 'returns development type' do
      allow(development).to receive(:kind_of?).and_return(Development)
      expect(development).to be_a_kind_of(Development)
    end

    it 'returns correct id' do
      expect(development.id).to eq(id)
    end

    it 'returns correct account' do
      expect(development.account).to eq(account)
      allow(development.account).to receive(:kind_of?).and_return(Account)
      expect(development.account).to be_a_kind_of(Account)
    end

    it 'returns correct project' do
      expect(development.project).to eq(project)
      allow(development.project).to receive(:kind_of?).and_return(Project)
      expect(development.project).to be_a_kind_of(Project)
    end
  end

  context '#to_s' do
    let(:id) { 1 }
    let(:account) { double('Account', id: 1, login: 'ksarzynski', password: 'kamil', person: double('Person', id: 1, firstname: 'Kamil', lastname: 'Sarzynski', salary: '1000')) }
    let(:project) { double('Project', id: 1, name: 'projekt1', start_date: Date.parse('2018-01-01'), deadline_date: Date.parse('2018-01-05')) }
    subject(:development) { Development.new id, account, project }

    it 'returns correct output' do
      expect(development.to_s).to be_a(String).and include(account.login, project.to_s)
    end
  end
end
