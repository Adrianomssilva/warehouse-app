require 'rails_helper'

RSpec.describe User, type: :model do
  describe "description" do
    it "exibe o nome e email" do
      # Arrange
      user = User.new(name:'Bianca Sedro', email: 'bianca@email.com')
      # Act
      result = user.description
      # Assert
      expect(result).to eq 'Bianca Sedro - bianca@email.com'

    end


  end

end
