require 'rails_helper'

describe "WAREHOUSE API V1" do

  context "chamada para ver um galão" do
    it "com sucesso" do
      warehouse = Warehouse.create!(name: 'Maceio', code: 'MCZ', city: 'Maceio', area: 50_000, address: 'Rua da orla, 100', cep:'30150-200', description: 'galpão de maceio')

      get "/api/v1/warehouses/#{warehouse.id}"

      expect(response).to have_http_status 200
      expect(response.content_type).to include 'application/json'
      json_response = JSON.parse(response.body)
      expect(json_response['name']).to eq  'Maceio'
      expect(json_response).not_to include  'area'


    end


  end


end
