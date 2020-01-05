require 'rails_helper'

RSpec.feature "List Products", type: :feature do
  scenario "visiting the home page shows all products ordered by age with proper age units" do
    products_in_order = [
      Product.create!(
        name: "product1",
        description: "description2",
        price_cents: 100,
        age_low_weeks: 0,
        age_high_weeks: 12,
      ),
      Product.create!(
        name: "product2",
        description: "description2",
        price_cents: 300,
        age_low_weeks: 13,
        age_high_weeks: 17
      ),
      Product.create!(
        name: "product3",
        description: "description3",
        price_cents: 1200,
        age_low_weeks: 21,
        age_high_weeks: 26
      ),
    ]

    visit "/"

    product_nodes = page.all(".products-list .product")
    expect(product_nodes.size).to eq(3)
    expect(product_nodes[0]).to have_text("product1")
    expect(product_nodes[0]).to have_text("0-12 weeks")
    expect(product_nodes[1]).to have_text("product2")
    expect(product_nodes[1]).to have_text("3-4 months")
    expect(product_nodes[2]).to have_text("product3")
    expect(product_nodes[2]).to have_text("5-6 months")

  end
end
