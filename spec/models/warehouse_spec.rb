require 'rails_helper'

RSpec.describe Warehouse, type: :model do
  describe "#valid?" do
    context "empty values" do

      it "false when name is empty" do
        # Arrange
        warehouse = Warehouse.new(name: '', code: 'RIO', city: 'Rio', address: 'algum lugar', cep: '40000-200', area: 10000, description: 'qualquer coisa')
        #Act
        result = warehouse.valid?
        #Assert
        expect(result).to eq false
      end
      it "false when code is empty" do
        # Arrange
        warehouse = Warehouse.new(name: 'r', code: '', city: 'Rio', address: 'algum lugar', cep: '40000-200', area: 10000, description: 'qualquer coisa')
        #Act
        result = warehouse.valid?
        #Assert
        expect(result).to eq false
      end
      it "false when address is empty" do
        # Arrange
        warehouse = Warehouse.new(name: 'r', code: 'RIO', city: 'Rio', address: '', cep: '40000-200', area: 10000, description: 'qualquer coisa')
        #Act
        result = warehouse.valid?
        #Assert
        expect(result).to eq false
      end
      it "false when city is empty" do
        # Arrange
        warehouse = Warehouse.new(name: 'r', code: 'RIO', city: '', address: 'rua', cep: '40000-200', area: 10000, description: 'qualquer coisa')
        #Act
        result = warehouse.valid?
        #Assert
        expect(result).to eq false
      end
      it "false when cep is empty" do
        # Arrange
        warehouse = Warehouse.new(name: 'r', code: 'RIO', city: 'Rio', address: 'rua', cep: '', area: 10000, description: 'qualquer coisa')
        #Act
        result = warehouse.valid?
        #Assert
        expect(result).to eq false
      end
      it "false when area is empty" do
        # Arrange
        warehouse = Warehouse.new(name: 'r', code: 'RIO', city: 'Rio', address: 'rua', cep: '40000-200', area: '' , description: 'qualquer coisa')
        #Act
        result = warehouse.valid?
        #Assert
        expect(result).to eq false
      end
      it "false when description is empty" do
        # Arrange
        warehouse = Warehouse.new(name: 'r', code: 'RIO', city: 'Rio', address: 'rua', cep: '40000-200', area: 1000, description: '')
        #Act
        result = warehouse.valid?
        #Assert
        expect(result).to eq false
      end
    end

    it "false when code is already in use" do

      # Arrange
      warehouse1 = Warehouse.create(name: 'Rio', code: 'RIO', city: 'Rio', address: 'algum lugar', cep: '40000-200', area: 10000, description: 'qualquer coisa')
      warehouse2 = Warehouse.new(name: 'Sp', code: 'RIO', city: 'Rio de', address: 'algum lugar além', cep: '40001-200', area: 12000, description: 'qualquer coisa aqui')
      # Act
      result = warehouse2.valid?
      # Assert
      expect(result).to eq false

    end


  end

end
