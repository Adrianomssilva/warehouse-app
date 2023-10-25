require 'rails_helper'

RSpec.describe Supplier, type: :model do
  describe "#valid?" do
    context "empty values" do
      it "false when corporate name is empty" do
        supplier = Supplier.new(corporate_name: '', brand_name: 'Nestle', registration_number: '1200909090909', full_address: 'rua das industrias, 100', city: 'Sorocaba', state: 'SP', email: 'contato@nestle.com.br')
        result = supplier.valid?
        expect(result).to eq false
      end
      it "false when brand name is empty" do
        supplier = Supplier.new(corporate_name: 'Nestle S/A', brand_name: '', registration_number: '1200909090909', full_address: 'rua das industrias, 100', city: 'Sorocaba', state: 'SP', email: 'contato@nestle.com.br')
        result = supplier.valid?
        expect(result).to eq false
      end
      it "false when registration number is empty" do
        supplier = Supplier.new(corporate_name: 'Nestle S/A', brand_name: 'Nestle', registration_number: '', full_address: 'rua das industrias, 100', city: 'Sorocaba', state: 'SP', email: 'contato@nestle.com.br')
        result = supplier.valid?
        expect(result).to eq false
      end
      it "false when full address is empty" do
        supplier = Supplier.new(corporate_name: 'Nestle S/A', brand_name: 'Nestle', registration_number: '1200909090909', full_address: '', city: 'Sorocaba', state: 'SP', email: 'contato@nestle.com.br')
        result = supplier.valid?
        expect(result).to eq false
      end
      it "false when city is empty" do
        supplier = Supplier.new(corporate_name: 'Nestle S/A', brand_name: 'Nestle', registration_number: '1200909090909', full_address: 'rua das industrias, 100', city: '', state: 'SP', email: 'contato@nestle.com.br')
        result = supplier.valid?
        expect(result).to eq false
      end
      it "false when state is empty" do
        supplier = Supplier.new(corporate_name: 'Nestle S/A', brand_name: 'Nestle', registration_number: '1200909090909', full_address: 'rua das industrias, 100', city: 'Sorocaba', state: '', email: 'contato@nestle.com.br')
        result = supplier.valid?
        expect(result).to eq false
      end
      it "false when email is empty" do
        supplier = Supplier.new(corporate_name: 'Nestle S/A', brand_name: 'Nestle', registration_number: '1200909090909', full_address: 'rua das industrias, 100', city: 'Sorocaba', state: 'SP', email: '')
        result = supplier.valid?
        expect(result).to eq false
      end

    end
  end

end
