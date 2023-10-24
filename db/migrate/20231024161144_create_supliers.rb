class CreateSupliers < ActiveRecord::Migration[7.1]
  def change
    create_table :supliers do |t|
      t.string :corporate_name
      t.string :brand_name
      t.integer :registration_number
      t.text :full_address
      t.string :city
      t.string :state
      t.string :email

      t.timestamps
    end
  end
end
