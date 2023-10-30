require 'rails_helper'

describe "usuário cadastra um pedido" do

  it "e deve estar autenticado" do
    # Arrange
    #
    #Act
    visit root_path
    click_on 'Registrar Pedido'
    # Assert
    expect(current_path).to eq   new_user_session_path

  end

  it "com sucesso" do
    # Arrange
    user = User.create!(name: 'Sergio', email: 'sergio@email.com', password: '123456')
    warehouse = Warehouse.create!(name: 'Rio', code: 'SDU', city: 'Rio de Janeiro', area: 60_000, address: 'Aeroporto do Galeão', cep: '20000-100', description: 'galpão localizado no aeroporto do galeão')
    warehouse1 = Warehouse.create!(name: 'Maceio', code: 'MCZ', city: 'Maceio', area: 50_000, address: 'Rua da orla, 100', cep:'30150-200', description: 'galpão de maceio')
    supplier =  Supplier.create!(corporate_name: 'Nestle S/A', brand_name: 'Nestle', registration_number: '1200909090909', full_address: 'rua das industrias, 100', city: 'Sorocaba', state: 'SP', email: 'contato@nestle.com.br')
    supplier1 = Supplier.create!(corporate_name: 'Coca S/A', brand_name: 'Coca-cola', registration_number: '1202312314123', full_address: 'rua das industrias, 112', city: 'Rio de Janeiro', state: 'RJ', email: 'contato@coca-cola.com.br')
    #Act
    login_as (user)
    visit root_path
    click_on 'Registrar Pedido'
    select warehouse.name, from: 'Galpão Destino'
    select supplier.corporate_name, from: 'Fornecedor'
    fill_in "Data Prevista de Entrega",	with: "20/12/2023"
    click_on 'Gravar'

    #Assert
    expect(page).to have_content 'Pedido registrado com sucesso'
    expect(page).to have_content 'Galpão Destino: Rio'
    expect(page).to have_content 'Fornecedor: Nestle S/A'
    expect(page).to have_content 'Data Prevista: 20/12/2023'
    expect(page).to have_content 'Usuário responsável: Sergio | sergio@email.com'
  end

end
