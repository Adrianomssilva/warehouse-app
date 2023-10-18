require "rails_helper"

describe "Usuário visita tela inicial" do

  it "e vê o nome do app" do
    # Arrange (único que pode estar vazio)

    #Act
    visit('/')

    #Assert
    expect(page).to have_content('Galpões & Estoque')
  end

  it "e vê os galpões na tela" do
    # Arrange
    # cadastrar 2 galpoes: Rio e Maceio
    Warehouse.create(name: 'Rio', code: 'SDU', city: 'Rio de janeiro', area: 60_000)
    Warehouse.create(name: 'Maceio', code: 'MCZ', city: 'Maceio', area: 50_000)

    # Act
    visit('/')

    # Assert
    # garantir que eu vejo na tela os galpoes Rio e Maceio
    expect(page).to have_content('Rio')
    expect(page).to have_content('SDU')
    expect(page).to have_content('Rio de Janeiro')
    expect(page).to have_content('60.000 m²')

    expect(page).to have_content('Maceio')
    expect(page).to have_content('MCZ')
    expect(page).to have_content('Maceio')
    expect(page).to have_content('50.000 m²')
  end



end
