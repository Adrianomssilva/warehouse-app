require 'rails_helper'

describe "Usuário entra na página de um fornecedor" do
  it "e vê detalhes do forncedor" do
    #Arrange
    Supplier.create!(corporate_name: 'Nestle S/A', brand_name: 'Nestle', registration_number: '1200909090909', full_address: 'rua das industrias, 100', city: 'Sorocaba', state: 'SP', email: 'contato@nestle.com.br')
    #Act
    visit root_path
    within('nav') do
      click_on 'Fornecedores'
    end
    click_on 'Nestle'
    #Assert
    expect(page).to have_content 'Nestle S/A'
    expect(page).to have_content 'Nome: Nestle'
    expect(page).to have_content 'Registro: 1200909090909'
    expect(page).to have_content 'Endereço: rua das industrias, 100'
    expect(page).to have_content 'Cidade: Sorocaba'
    expect(page).to have_content 'Estado: SP'
    expect(page).to have_content 'Email: contato@nestle.com.br'
  end

  it "e volta" do
    #Arrange
    Supplier.create!(corporate_name: 'Nestle S/A', brand_name: 'Nestle', registration_number: '1200909090909', full_address: 'rua das industrias, 100', city: 'Sorocaba', state: 'SP', email: 'contato@nestle.com.br')
    #Act
    visit root_path
    within('nav') do
      click_on 'Fornecedores'
    end
    click_on 'Nestle'
    click_on 'Voltar'
    #Assert
    expect(current_path).to eq  suppliers_path
  end


end
