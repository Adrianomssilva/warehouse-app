class RenameSuplierToSupplier < ActiveRecord::Migration[7.1]
  def change
    rename_table :supliers, :suppliers
  end
end
