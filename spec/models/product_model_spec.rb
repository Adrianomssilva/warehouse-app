require 'rails_helper'

RSpec.describe ProductModel, type: :model do
  describe "#valid?" do
    it "name is mandatory" do
      supplier = Supplier.create!(brand_name: 'Samsung', corporate_name: 'Samsung Eletrônicos - LTDA', registration_number: '1231234', full_address:'rua do limoeiro, 100', city: 'São Paulo', state: 'SP', email: 'contato@samsung.com.br')
      pm = ProductModel.new(name: '', weight: 8000, width: 70, height: 45, depth: 10, sku: 'TV32-SAMSU-XPT90', supplier: supplier)

      result = pm.valid?

      expect(result).to eq false
    end
    it "sku is mandatory" do
      supplier = Supplier.create!(brand_name: 'Samsung', corporate_name: 'Samsung Eletrônicos - LTDA', registration_number: '1231234', full_address:'rua do limoeiro, 100', city: 'São Paulo', state: 'SP', email: 'contato@samsung.com.br')
      pm = ProductModel.new(name: 'TV32', weight: 8000, width: 70, height: 45, depth: 10, sku: '', supplier: supplier)

      result = pm.valid?

      expect(result).to eq false
    end


  end

end
