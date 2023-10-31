require 'rails_helper'

RSpec.describe Order, type: :model do

  describe "#valid?" do
    it "data estimada de entrega deve ser obrigatória" do
      # Arrange
      order = Order.new(estimated_delivery_date: '')

      # Act
      order.valid?
      result = order.errors.include?(:estimated_delivery_date)

      # Arrange
      expect(result).to be true
    end

    it "data estimada de entrega não deve ser passada" do
      # Arrange
      order = Order.new(estimated_delivery_date: 1.day.ago)

      # Act
      order.valid?
      result = order.errors.include?(:estimated_delivery_date)

      # Assert
      expect(result).to be true
      expect(order.errors[:estimated_delivery_date]).to include("deve ser futura")
    end

    it "data estimada de entrega não deve ser presente" do
      # Arrange
      order = Order.new(estimated_delivery_date: Date.today)

      # Act
      order.valid?
      result = order.errors.include?(:estimated_delivery_date)

      # Assert
      expect(result).to be true
      expect(order.errors[:estimated_delivery_date]).to include("deve ser futura")
    end
    it "data estimada de entrega deve ser igual ao maior que amanhã" do
      # Arrange
      order = Order.new(estimated_delivery_date: 1.day.from_now)

      # Act
      order.valid?
      result = order.errors.include?(:estimated_delivery_date)

      # Assert
      expect(result).to be false
    end

    it "deve ter um código" do
      # Arrange
      warehouse = Warehouse.create!(name: 'Rio', code: 'SDU', city: 'Rio de Janeiro', area: 60_000, address: 'Aeroporto do Galeão', cep: '20000-100', description: 'galpão localizado no aeroporto do galeão')

      supplier = Supplier.create!(corporate_name: 'Nestle S/A', brand_name: 'Nestle', registration_number: '1200909090909', full_address: 'rua das industrias, 100', city: 'Sorocaba', state: 'SP', email: 'contato@nestle.com.br')

      user = User.create!(name: 'Sergio', email: 'sergio@email.com', password: '123456')

      order = Order.new(user: user, warehouse: warehouse, supplier: supplier, estimated_delivery_date: '2025-10-11')
      #Act
      result = order.valid?
      #Assert
      expect(result).to be true
    end
  end

  describe "gera um código aleatório" do
    it "ao criar um novo pedido" do
      # Arrange
      warehouse = Warehouse.create!(name: 'Rio', code: 'SDU', city: 'Rio de Janeiro', area: 60_000, address: 'Aeroporto do Galeão', cep: '20000-100', description: 'galpão localizado no aeroporto do galeão')

      supplier = Supplier.create!(corporate_name: 'Nestle S/A', brand_name: 'Nestle', registration_number: '1200909090909', full_address: 'rua das industrias, 100', city: 'Sorocaba', state: 'SP', email: 'contato@nestle.com.br')

      user = User.create!(name: 'Sergio', email: 'sergio@email.com', password: '123456')

      order = Order.new(user: user, warehouse: warehouse, supplier: supplier, estimated_delivery_date: '2025-10-11')
      #Act
      order.save!
      result = order.code
      #Assert
        expect(result).not_to be_empty
        expect(result.length).to eq 8
    end
    it "o código é único" do
      # Arrange
      warehouse = Warehouse.create!(name: 'Rio', code: 'SDU', city: 'Rio de Janeiro', area: 60_000, address: 'Aeroporto do Galeão', cep: '20000-100', description: 'galpão localizado no aeroporto do galeão')

      supplier = Supplier.create!(corporate_name: 'Nestle S/A', brand_name: 'Nestle', registration_number: '1200909090909', full_address: 'rua das industrias, 100', city: 'Sorocaba', state: 'SP', email: 'contato@nestle.com.br')

      user = User.create!(name: 'Sergio', email: 'sergio@email.com', password: '123456')

      first_order = Order.create!(user: user, warehouse: warehouse, supplier: supplier, estimated_delivery_date: '2024-10-11')
      second_order = Order.new(user: user, warehouse: warehouse, supplier: supplier, estimated_delivery_date: '2025-11-15')
      #Act
      second_order.save!
      #Assert
        expect(second_order.code).not_to eq first_order.code
    end

  end

end
