require 'rails_helper'

RSpec.describe 'Fonctions du modèle utilisateur', type: :model do
  describe 'Test de Validation' do
    context 'Si le nom de l\'utilisateur est une chaîne vide' do
      it 'Validation échoue' do
        user = User.create(
          name: "",
          email: "user@user.com",
          password: "password",
          password_confirmation: "password",
        )
        expect(user).not_to be_valid
      end
    end

    context 'Si l\'adresse électronique de l\'utilisateur est vide' do
      it 'Validation échoue' do
        user = User.create(
          name: "user1",
          email: "",
          password: "password",
          password_confirmation: "password",
        )
        expect(user).not_to be_valid
      end
    end

    context 'Si le mot de passe de l\'utilisateur est vide' do
      it 'Validation échoue' do
        user = User.create(
          name: "user1",
          email: "user@user.com",
          password: "",
          password_confirmation: "",
        )
        expect(user).not_to be_valid
      end
    end

    context 'Si l\'adresse électronique de l\'utilisateur était déjà utilisée' do
      let!(:user) { FactoryBot.create(:user, email: "user@user.com") }
      it 'Validation échoue' do
        user = User.create(
          name: "user1",
          email: "user@user.com",
          password: "password",
          password_confirmation: "password",
        )
        expect(user).not_to be_valid
      end
    end

    context 'Si le mot de passe de l\'utilisateur comporte moins de 6 caractères.' do
      it 'Validation échoue' do
        user = User.create(
          name: "user1",
          email: "user@user.com",
          password: "pass",
          password_confirmation: "pass",
        )
        expect(user).not_to be_valid
      end
    end

    context 'Si le nom de l\'utilisateur a une valeur, l\'adresse électronique est une valeur non utilisée et le mot de passe comporte au moins 6 caractères.' do
      it 'Validation Le succès dans' do
        user = User.create(
          name: "user1",
          email: "user@user.com",
          password: "password",
          password_confirmation: "password",
        )
        expect(user).to be_valid
      end
    end
  end
end