class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :children do |t|
      t.string :full_name, null: false, comment: "The child's full name"
      t.date :birthdate, null: false, comment: "This child's birthdate or expecting date"
      t.string :parent_name, null: false, comment: "The full name of the child's parent"

      t.timestamps
    end

    add_index :children, [ :full_name, :birthdate, :parent_name ], unique: true

    create_table :orders do |t|
      t.string :user_facing_id, null: false, unique: true, comment: "A user-facing ID we can give the user to track their order in our system"
      t.references :product, null: false, foreign_key: true, comment: "What product is this order for?"
      t.references :child, null: false, foreign_key: true, comment: "Which child is this for?"
      t.string :shipping_name, null: false, comment: "Name of who we are shipping to"
      t.string :address, null: false, comment: "Street Address for shipping"
      t.string :zipcode, null: false, comment: "Zip Code for shipping"
      t.boolean :paid, null: false, comment: "True if this order has been paid via a successful charge"

      t.timestamps
    end
  end
end
