require 'rails_helper'

describe "usuário se atutentica" do
  it "com sucesso" do
    #  Arrange
    #
    #Act
    visit root_path
    click_on 'Entrar'
    click_on 'Criar conta'
    fill_in "E-mail",	with: "bianca@email.com"
    fill_in "Nome",	with: "Bianca"
    fill_in "Senha",	with: "password"
    fill_in "Confirme sua senha",	with: "password"
    click_on 'Criar conta'

    # Assert
    expect(page).to have_content 'Boas vindas! Você realizou seu registro com sucesso.'
    expect(page).to have_content 'bianca@email.com'
    expect(page).to have_button 'Sair'
    user = User.last
    expect(user.name).to eq 'Bianca'

  end

end
