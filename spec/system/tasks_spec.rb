require 'rails_helper'

RSpec.describe 'Fonction de gestion des tâches', type: :system do
  describe 'Fonction d\'enregistrement' do
    context 'Lors de l\'enregistrement d\'une tâche' do
      it 'La tâche enregistrée s\'affiche' do
        Task.create!(title: 'Préparation des documents', content: 'Créer une proposition.')
        visit tasks_path
        expect(page).to have_content 'Préparation des documents'
      end
    end
  end

  describe 'Fonction d\'affichage de liste' do
    context 'Lors de la transition vers l\'écran de liste' do
      it 'Une liste des tâches enregistrées s\'affiche' do
        FactoryBot.create(:task)
        visit tasks_path
        expect(page).to have_content 'Test1'
      end
    end
  end

  describe 'Fonction d\'affichage détaillée' do
     context 'Lors de la transition vers un écran de détails de tâche' do
      let(:task) {FactoryBot.create(:task, title:'first_test', content:'test_validation')}
       it 'Le contenu de la tâche s\'affiche' do
        visit task_path(task)
        expect(page).to have_content 'first_test'
       end
     end
  end
end