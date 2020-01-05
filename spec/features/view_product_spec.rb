require 'rails_helper'

RSpec.feature "View Product", type: :feature do
  scenario "Shows the product description and price" do
    product = Product.create!(
      name: "product1",
      description: "description2",
      price_cents: 1000,
      age_low_weeks: 0,
      age_high_weeks: 12,
    )

    visit "/"

    within ".products-list .product" do
      click_on "More Details…"
    end

    expect(page).to have_content("description2")
    expect(page).to have_content("$10.00")
  end
end
