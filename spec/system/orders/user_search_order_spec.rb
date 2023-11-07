require 'rails_helper'

describe "usuário busca com um pedido" do

  it "a partir do menu" do
    # Arrange
    user = User.create!(name: 'Adriano Silva', email: 'adriano@email.com', password: 'password')
    # Act
    login_as(user)
    visit root_path
    # Assert
    within ('nav') do
      expect(page).to have_field 'Buscar Pedido'
      expect(page).to have_button 'Buscar'
    end
  end


end
