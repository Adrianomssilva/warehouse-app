require 'rails_helper'

describe "Usuário cria fornecedor" do
  it "a partir da tela inicial" do

    #Arrange
    #
    #Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'Novo Fornecedor'
    #Assert
    expect(page).to have_field 'Razão Social'
    expect(page).to have_field 'Nome Fantasia'
    expect(page).to have_field 'CNPJ'
    expect(page).to have_field 'Endereço'
    expect(page).to have_field 'Cidade'
    expect(page).to have_field 'Estado'
    expect(page).to have_field 'E-mail'

  end

  it "com sucesso" do
    # Arrange
    #
    #Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'Novo Fornecedor'

    fill_in "Razão Social",	with: "Nestle S/A"
    fill_in "Nome Fantasia",	with: "Nestle"
    fill_in "CNPJ",	with: "203010/0001-40"
    fill_in "Endereço",	with: "Rua das industrias, 120"
    fill_in "Cidade",	with: "Sorocaba"
    fill_in "Estado",	with: "SP"
    fill_in "E-mail",	with: "contato@nestle.com.br"
    click_on 'Enviar'

    # Assert
    expect(current_path).to eq suppliers_path
    expect(page).to have_content 'Fornecedor cadastrado com sucesso!'
    expect(page).to have_content 'Nestle'
    expect(page).to have_content 'Sorocaba'
  end

  it "sem sucesso com algum campo em branco" do
    # Arrange
    #
    #Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'Novo Fornecedor'

    fill_in "Razão Social",	with: ""
    fill_in "Nome Fantasia",	with: "Nestle"
    fill_in "CNPJ",	with: "203010/0001-40"
    fill_in "Endereço",	with: ""
    fill_in "Cidade",	with: "Sorocaba"
    fill_in "Estado",	with: "SP"
    fill_in "E-mail",	with: "contato@nestle.com.br"
    click_on 'Enviar'

    # Assert
    expect(page).to have_content 'Fornecedor não cadastrado.'
    expect(page).to have_content 'Razão Social não pode ficar em branco'
  end


end
