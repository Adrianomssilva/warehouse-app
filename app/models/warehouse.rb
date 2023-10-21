class Warehouse < ApplicationRecord
  validates :name, :code, :city, :area, :address, :cep, presence: true
end
