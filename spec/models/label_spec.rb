require 'rails_helper'

RSpec.describe 'Fonction de modèle d\'étiquette', type: :model do
  describe 'Essai de validation' do
    context 'Si le nom de l\'étiquette est une chaîne vide' do
      it 'échoue la validation' do
        user = FactoryBot.create(:user, email: 'test@ex.com')
        label = Label.create(name: '', user: user)
        expect(label).not_to be_valid
      end
    end

    context 'Si le nom du libellé avait une valeur' do
      it 'Valider avec succès' do
        user = FactoryBot.create(:user,email: 'testtest@ex.com')
        label = Label.create(name: 'label1', user: user)
        expect(label).to be_valid
      end
    end
  end
end