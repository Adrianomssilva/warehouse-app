require 'rails_helper'

describe "usuário edita galpão" do
    it "a partir da página de detalhes" do
      # Arrange
      warehouse = Warehouse.create!(name: 'Maceio', code: 'MCZ', city: 'Maceio', area: 50_000, address: 'Rua da orla, 100', cep:'30150-200', description: 'galpão de maceio')
      #Act
      visit root_path
      click_on 'Maceio'
      click_on "Editar"
      #Assert
      expect(page).to have_content 'Editar Galpão'
      expect(page).to have_field('Nome' , with: 'Maceio')
      expect(page).to have_field('Código')
      expect(page).to have_field('Cidade')
      expect(page).to have_field('Área')
      expect(page).to have_field('Endereço')
      expect(page).to have_field('CEP')
      expect(page).to have_field('Descrição')
    end

    it "com sucesso" do
      # Arrange
      warehouse = Warehouse.create!(name: 'Maceio', code: 'MCZ', city: 'Maceio', area: 50_000, address: 'Rua da orla, 100', cep:'30150-200', description: 'galpão de maceio')
      #Act
      visit root_path
      click_on 'Maceio'
      click_on "Editar"
      fill_in 'Nome', with: 'Galpão Maceio'
      fill_in 'Área', with: '100000'
      fill_in 'Endereço', with: 'orla, 120'
      click_on 'Enviar'

      # Assert
        expect(page).to have_content 'Galpão editado com sucesso'
        expect(page).to have_content 'Nome: Galpão Maceio'
        expect(page).to have_content 'Área: 100000'
        expect(page).to have_content 'Endereço: orla, 120'
    end

    it "com conteúdo em branco" do
      # Arrange
      warehouse = Warehouse.create!(name: 'Maceio', code: 'MCZ', city: 'Maceio', area: 50_000, address: 'Rua da orla, 100', cep:'30150-200', description: 'galpão de maceio')
      #Act
      visit root_path
      click_on 'Maceio'
      click_on "Editar"
      fill_in 'Nome', with: ''
      fill_in 'Área', with: ''
      fill_in 'Endereço', with: ''
      click_on 'Enviar'

      # Assert
      expect(page).to have_content 'Não foi possível editar o galpão'


    end


end
