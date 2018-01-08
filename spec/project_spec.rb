require_relative '../lib/project.rb'

RSpec.describe 'Project' do
  context '#new' do
    let(:id) { 1 }
    let(:name) { 'projekt' }
    let(:start_date) { Date.parse('2018-01-05 00:00:00')  }
    let(:deadline_date) { Date.parse('2018-01-05 00:00:00')  }
    subject(:project) { Project.new id, name, start_date, deadline_date}

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
      expect(project.start_date.to_s).to eq(start_date.to_s)
      expect(project.start_date).to be_a(Date)
    end

    it 'returns correct date' do
      expect(project.deadline_date.to_s).to eq(deadline_date.to_s)
      expect(project.deadline_date).to be_a(Date)
    end
  end

  context '#to_s' do
    subject(:project) { Project.new 1, 'project1', Date.parse('2018-01-05 00:00:00'), Date.parse('2018-01-05 00:00:00') }

    it 'returns correct output' do
      expect(project.to_s).to be_a(String).and include('project1 - 2018-01-05 00:00:00 - 2018-01-05 00:00:00')
    end
  end
end
