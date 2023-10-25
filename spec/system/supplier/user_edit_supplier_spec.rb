require 'rails_helper'

describe "usário edita um fornecedor já cadastrado" do
  it "e chega na página de edição" do
    # Arrange
    supplier1 = Supplier.create!(corporate_name: 'Nestle S/A', brand_name: 'Nestle', registration_number: '1200909090909', full_address: 'rua das industrias, 100', city: 'Sorocaba', state: 'SP', email: 'contato@nestle.com.br')
    # Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'Nestle'
    click_on 'Editar'

    # Assert
    expect(page).to have_content 'Editar Fornecedor'
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
    supplier1 = Supplier.create!(corporate_name: 'Nestle S/A', brand_name: 'Nestle', registration_number: '1200909090909', full_address: 'rua das industrias, 100', city: 'Sorocaba', state: 'SP', email: 'contato@nestle.com.br')
    # Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'Nestle'
    click_on 'Editar'
    fill_in "Nome Fantasia",	with: "Coca-cola"
    fill_in "Cidade",	with: "Rio de Janeiro"
    fill_in "Razão Social",	with: "Coca S/A"
    click_on 'Enviar'

    # Assert
    expect(page).to have_content 'Fornecedor editado com sucesso'
    expect(page).to have_content 'Coca S/A'
    expect(page).to have_content 'Nome: Coca-cola'
    expect(page).to have_content 'Cidade: Rio de Janeiro'

  end
  it "sem sucesso" do
    # Arrange
    supplier1 = Supplier.create!(corporate_name: 'Nestle S/A', brand_name: 'Nestle', registration_number: '1200909090909', full_address: 'rua das industrias, 100', city: 'Sorocaba', state: 'SP', email: 'contato@nestle.com.br')
    # Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'Nestle'
    click_on 'Editar'
    fill_in "Nome Fantasia",	with: ""
    fill_in "Cidade",	with: ""
    fill_in "Razão Social",	with: ""
    click_on 'Enviar'

    # Assert
    expect(page).to have_content 'Não foi possível editar o fornecedor'
  end

end
