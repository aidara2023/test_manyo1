require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'Test de Validation' do
    context 'Si le Title de la tâche est une chaîne vide' do
      it 'Validation échoue' do
        task = Task.create(title: '', content: 'Créer une proposition.', deadline_on: Date.today,
        priority: 'low',
        status: 'done')
        expect(task).not_to be_valid
      end
    end

    context 'Si la description de la tâche est vide' do
      it 'Validation échoue' do
        task = Task.create(title: 'new_task', content: '',  deadline_on: 'Date.today',
        priority: '',
        status: 'done',)
        expect(task).not_to be_valid
      end
    end

    context 'Si le Title et la description de la tâche ont des valeurs' do
      it 'Vous pouvez enregistrer une tâche' do
        task = Task.create(title: 'new_task', content: 'Créer une proposition.', deadline_on: Date.today,
        priority: 'low',
        status: '',)
        expect(task).not_to be_valid
      end
    end

    context 'If the task Title and description have values' do
      it 'You can register a task' do
        task = Task.create(
          title: 'Titre2', 
          content: 'Create a proposal.',
          deadline_on: Date.today,
          priority: 'low',
          status: 'done',
          )
        expect(task).to be_valid
      end
    end
  end

  describe 'search function' do
    let!(:first_task) { FactoryBot.create(:task, title: 'first_task_title') }
    let!(:second_task) { FactoryBot.create(:second_task, title: "second_task_title") }
    let!(:third_task) { FactoryBot.create(:third_task, title: "third_task_title") }

    context 'If a fuzzy search for a title is performed using the scope method' do
      it "Tasks containing search terms are narrowed down." do
        expect(Task.search_title('first')).to include(first_task)
        expect(Task.search_title('first')).not_to include(second_task)
        expect(Task.search_title('first')).not_to include(third_task)
        expect(Task.search_title('first').count).to eq 1
      end
    end

    context 'If a status search is performed using the scope method' do
      it "Tasks with an exact match to the status are narrowed down." do
        expect(Task.search_status('doing')).not_to include(first_task)
        expect(Task.search_status('doing')).to include(second_task)
        expect(Task.search_status('doing')).not_to include(third_task)
        expect(Task.search_status('doing').count).to eq 1
      end
    end
    
    context 'Ambiguous title and status searches in the scope method' do
      it "Tasks are narrowed down to those that include the search term in the title and match the status exactly." do
        expect(Task.search_title('first').search_status('todo')).to include(first_task)
        expect(Task.search_title('first').search_status('todo')).not_to include(second_task)
        expect(Task.search_title('first').search_status('todo')).not_to include(third_task)
        expect(Task.search_title('first').search_status('todo').count).to eq 1
      end
    end

  end
end