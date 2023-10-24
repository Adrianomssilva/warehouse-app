require 'rails_helper'

describe "Usuário cria fornecedore" do
  it "a partir da tela inicial" do

    #Arrange
    #
    #Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'Novo Fornecedor'
    #Assert
    expect(page).to have_field ''

  end


end
