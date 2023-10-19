require 'rails_helper'

describe "Usuários vê detalhe de galpão" do
    it "e vê informações adicionais" do
      # Arrange
      Warehouse.create(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000, address: 'Avenida do Aeroporto, 1000', cep: '15000-000', description: 'Galpão destinado a cargas internacionais' )
      #Act
      visit(root_path)
      click_on('Aeroporto SP')

      #Assert
      expect(page).to have_content('Galpão GRU')
      expect(page).to have_content('Nome: Aeroporto SP')
      expect(page).to have_content('Cidade: Guarulhos')
      expect(page).to have_content('Área: 100000 m²')
      expect(page).to have_content('Endereço: Avenida do Aeroporto, 1000')
      expect(page).to have_content('CEP: 15000-000')
      expect(page).to have_content('Galpão destinado a cargas internacionais')
    end

    it "e volta para tela inicial" do
      # Arrange
      Warehouse.create(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000, address: 'Avenida do Aeroporto, 1000', cep: '15000-000', description: 'Galpão destinado a cargas internacionais' )

      #Act
      visit(root_path)
      click_on('Aeroporto SP')
      click_on ('Voltar')

      #Assert
      expect(current_path).to eq(root_path)
    end

end
