class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products, comment: "Product catalog" do |t|
      t.string :name, null: false, unique: true, comment: "The name of the product"
      t.text :description, null: false, comment: "Longer description of the product"
      t.integer :price_cents, null: false, comment: "Retail price, in cents, of the product"
      t.integer :age_low_weeks, null: false, comment: "Lowest appropriate age for this product, in weeks"
      t.integer :age_high_weeks, null: false, comment: "Highest appropriate age for this product, in weeks"

      t.timestamps
    end
  end
end
