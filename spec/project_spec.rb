require_relative '../lib/project.rb'

RSpec.describe 'Project' do
  context '#new' do
    let(:id) { 1 }
    let(:name) { 'projekt' }
    let(:date) { Date.parse('2018-01-09')  }
    let(:deadlinedate) { Date.parse('2018-01-09')  }
    subject(:project) { Project.new id, name, date, deadlinedate}

    it 'creates a new project' do
      expect { project }.not_to raise_error
    end

    it 'returns project type' do
      allow(project).to receive(:kind_of?).and_return(Project)
      expect(project).to be_a_kind_of(Project)
    end

    it 'returns correct id' do
      expect(project.id).to eq(id)
    end

    it 'returns correct date' do
      expect(project.date.to_s).to eq(date.to_s)
      expect(project.date).to be_a(Date)
    end

    it 'returns correct date' do
      expect(project.deadlinedate.to_s).to eq(deadlinedate.to_s)
      expect(project.deadlinedate).to be_a(Date)
    end
  end

  context '#to_s' do
    subject(:project) { Project.new 1, 'project1', Date.parse('2018-01-05'), Date.parse('2018-01-05') }

    it 'returns correct output' do
      expect(project.to_s).to be_a(String).and include('project1 - 2018-01-05 - 2018-01-05')
    end
  end
end
