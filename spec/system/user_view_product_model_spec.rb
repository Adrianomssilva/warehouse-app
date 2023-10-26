require 'rails_helper'

describe "Usuário vê modelos de produtos" do

  it "a partir de menu" do

    # Arrange
    #
    #Act
    visit root_path
    within('nav') do
      click_on 'Modelos de Produtos'
    end
    #Assert
    expect(current_path).to eq product_models_path
  end

  it "e vê os produtos com sucesso" do

    # Arrange
    supplier = Supplier.create!(brand_name: 'Samsung', corporate_name: 'Samsung Eletrônicos - LTDA', registration_number: '1231234', full_address:'rua do limoeiro, 100', city: 'São Paulo', state: 'SP', email: 'contato@samsung.com.br')
    ProductModel.create!(name: 'Tv 32', weight: 8000, width: 70, height: 45, depth: 10, sku: 'TV32-SAMSU-XPT90', supplier: supplier)
    ProductModel.create!(name: 'SoundBar 7.1 Surround', weight: 3000, width: 80, height: 15, depth: 20, sku: 'SOU71-SAMSU-NOIZ77', supplier: supplier)
    #Act
    visit root_path
    within('nav') do
      click_on 'Modelos de Produtos'
    end
    #Assert
    expect(current_path).to eq product_models_path
    expect(page).to have_content 'Tv 32'
    expect(page).to have_content 'TV32-SAMSU-XPT90'
    expect(page).to have_content 'Samsung'
    expect(page).to have_content 'SoundBar 7.1 Surround'
    expect(page).to have_content 'SOU71-SAMSU-NOIZ77'
    expect(page).to have_content 'Samsung'
  end

  it "e não tem nenhum produto cadastrado" do
    # Arrange
    #
    #Act
    visit root_path
    click_on 'Modelos de Produtos'

    # Assert
    expect(page).to have_content 'Não existe nenhum produto cadastrado'
  end



end
