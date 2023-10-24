require 'rails_helper'

describe "Usuário remove um galpão" do

  it "com sucesso" do
    # Arrange
    Warehouse.create!(name: 'Rio', code: 'SDU', city: 'Rio de Janeiro', area: 60_000, address: 'Aeroporto do Galeão', cep: '20000-100', description: 'galpão localizado no aeroporto do galeão')
    #Act
    visit root_path
    click_on 'Rio'
    click_on 'Remover'
    #Assert
      expect(current_path).to eq root_path
      expect(page).to have_content 'Galpão removido com sucesso'
      expect(page).not_to have_content 'Rio'
      expect(page).not_to have_content 'SDU'

  end
  it "apenas o galpão correto é apagado" do
    # Arrange
    Warehouse.create!(name: 'Rio', code: 'SDU', city: 'Rio de Janeiro', area: 60_000, address: 'Aeroporto do Galeão', cep: '20000-100', description: 'galpão localizado no aeroporto do galeão')
    Warehouse.create!(name: 'Sp', code: 'SPG', city: 'São Paulo', area: 100_000, address: 'Grande São Paulo, 200', cep: '12000-100', description: 'galpão localizado no centro de SP')
    #Act
    visit root_path
    click_on 'Rio'
    click_on 'Remover'
    #Assert
      expect(current_path).to eq root_path
      expect(page).to have_content 'Galpão removido com sucesso'
      expect(page).not_to have_content 'Rio'
      expect(page).to have_content 'Sp'

  end
end
