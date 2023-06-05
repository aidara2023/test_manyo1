require 'rails_helper'

RSpec.describe 'Fonction de modèle de tâche', type: :model do
  describe 'Test de Validation' do
    context 'Si le Title de la tâche est une chaîne vide' do
      it 'Validation échoue' do
        task = Task.create(title: '', content: 'Créer une proposition.')
        expect(task).not_to be_valid
      end
    end

    context 'Si la description de la tâche est vide' do
      it 'Validation échoue' do
        task = Task.create(title: 'new_task', content: '')
        expect(task).not_to be_valid
      end
    end

    context 'Si le Title et la description de la tâche ont des valeurs' do
      it 'Vous pouvez enregistrer une tâche' do
        task = Task.create(title: 'new_task', content: 'Créer une proposition.')
        expect(task).to be_valid
      end
    end

  end
end