class ChangeRegistrationNumberType < ActiveRecord::Migration[7.1]
  def change
    change_column :suppliers, :registration_number, :string
  end
end
