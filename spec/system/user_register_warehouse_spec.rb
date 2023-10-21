require 'rails_helper'


describe "usuário cadastra um galpão" do
  it "a partir da tela inicial" do

    # Arrange

    #Act
    visit root_path
    click_on 'Cadastrar Galpão'

    #Assert
    expect(page).to have_field('Nome')
    expect(page).to have_field('Código')
    expect(page).to have_field('Cidade')
    expect(page).to have_field('Área')
    expect(page).to have_field('Endereço')
    expect(page).to have_field('Cep')
    expect(page).to have_field('Descrição')

  end

  it "com sucesso" do
    # ACT
    visit root_path
    click_on 'Cadastrar Galpão'

    fill_in "Nome",	with: "Rio de Janeiro"
    fill_in "Código",	with: "GIG"
    fill_in "Cidade",	with: "Rio de Janeiro"
    fill_in "Área",	with: "150000"
    fill_in "Endereço",	with: "Aeroporto Galeão, n 100"
    fill_in "Cep",	with: "08150-000"
    fill_in "Descrição",	with: "Galpão localizado no Aeroporto Galeão no Rio de Janeiro"
    click_on 'Enviar'
    # Assert
    expect(current_path).to eq root_path
    expect(page).to have_content 'Galpão cadastrado com sucesso'
    expect(page).to have_content 'Rio de Janeiro'
    expect(page).to have_content 'GIG'
    expect(page).to have_content '150000 m²'
  end

  it "sem sucesso" do

    # Act
    visit root_path
    click_on 'Cadastrar Galpão'

    fill_in "Nome",	with: ""
    fill_in "Código",	with: ""
    fill_in "Cidade",	with: ""
    click_on 'Enviar'

    # Assert
    expect(page).to have_content 'Galpão não cadastrado'

  end



end
