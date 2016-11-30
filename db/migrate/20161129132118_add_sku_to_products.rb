class AddSkuToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :sku, :integer
    add_index :products, :sku
  end
end
