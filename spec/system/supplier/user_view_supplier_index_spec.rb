require 'rails_helper'

describe "O usário vai chegar na página inicial de fornecedores" do

    it "com sucesso" do

      # Arrange
      #Act
      visit root_path
      within('nav') do
        click_on 'Fornecedores'
      end
      #Assert
      expect(page).to have_content 'Fornecedores'

    end

    it "chega e não vê fornecedores cadastrados" do
      # Arrange
      #Act
      visit root_path
      within('nav') do
        click_on 'Fornecedores'
      end
      #Assert
      expect(page).to have_content 'Fornecedores'
      expect(page).to have_content 'Não existem fornecedores cadastrados'

    end
    it "chega e vê fornecedores cadastrados" do
      # Arrange
      Supplier.create!(corporate_name: 'Nestle S/A', brand_name: 'Nestle', registration_number: '1200909090909', full_address: 'rua das industrias, 100', city: 'Sorocaba', state: 'SP', email: 'contato@nestle.com.br')
      #Act
      visit root_path
      within('nav') do
        click_on 'Fornecedores'
      end
      #Assert
      expect(page).to have_content 'Fornecedores'
      expect(page).not_to have_content 'Não existem fornecedores cadastrados'
      expect(page).to have_content 'Nestle'
      expect(page).to have_content 'Sorocaba'

    end

end
