require 'rails_helper'
RSpec.describe 'Fonction de gestion des étiquettes', type: :system do
  let!(:user) { FactoryBot.create(:user, name: 'test_user', email: 'test1@ex.com', password: 'password', password_confirmation: 'password', admin: false) }
  def log_in
    visit new_session_path
    fill_in "session[email]",	with: "test1@ex.com" 
    fill_in "session[password]",	with: "password" 
    click_on 'create-session'
  end

  describe 'Fonction d\'enregistrement' do
    before { log_in }

    context 'Si vous avez enregistré un label' do
      it 'L\'étiquette enregistrée s\'affiche' do
        visit new_label_path
        fill_in "Name",	with: "test" 
        click_on 'Creer'
        expect(page).to have_content 'Etiquette enregistrée'
        expect(page).to have_content 'test'
      end
    end
  end
  describe 'Fonction d\'affichage de liste' do
    context 'Lors de la transition vers l\'écran de liste' do
      before do
        FactoryBot.create(:label, name: 'label1', user: user)
        FactoryBot.create(:label, name: 'label2', user: user)

        log_in
        visit labels_path
      end

      it 'Une liste des étiquettes enregistrées s\'affiche.' do
        labels_list = all('body tr')
        expect(labels_list[1].text).to have_content('label1')
        expect(labels_list[2].text).to have_content('label2')
      end
    end
  end
end