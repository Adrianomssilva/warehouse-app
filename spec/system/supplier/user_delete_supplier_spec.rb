require 'rails_helper'

describe "o usuário deleta um galpão" do

  it "com sucesso" do
    # Arrange
    supplier1 = Supplier.create!(corporate_name: 'Nestle S/A', brand_name: 'Nestle', registration_number: '1200909090909', full_address: 'rua das industrias, 100', city: 'Sorocaba', state: 'SP', email: 'contato@nestle.com.br')
    # Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'Nestle'
    click_on 'Remover'

    # Assert
    expect(page).to have_content 'Fornecedor removido com sucesso'
    expect(page).not_to have_content 'Nestle'
    expect(page).not_to have_content 'Sorocaba'
  end
  it "apenas o certo é deletado" do
    # Arrange
    supplier1 = Supplier.create!(corporate_name: 'Nestle S/A', brand_name: 'Nestle', registration_number: '1200909090909', full_address: 'rua das industrias, 100', city: 'Sorocaba', state: 'SP', email: 'contato@nestle.com.br')
    supplier1 = Supplier.create!(corporate_name: 'Coca S/A', brand_name: 'Coca-cola', registration_number: '1202312314123', full_address: 'rua das industrias, 112', city: 'Rio de Janeiro', state: 'RJ', email: 'contato@coca-cola.com.br')
    # Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'Nestle'
    click_on 'Remover'

    # Assert
    expect(page).to have_content 'Fornecedor removido com sucesso'
    expect(page).not_to have_content 'Nestle'
    expect(page).not_to have_content 'Sorocaba'
    expect(page).to have_content 'Coca-cola'
    expect(page).to have_content 'Rio de Janeiro'
  end


end
