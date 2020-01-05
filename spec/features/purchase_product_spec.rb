require 'rails_helper'

RSpec.feature "Purchase Product", type: :feature do
  scenario "Creates an order and charges us" do
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

    click_on "Buy Now $10.00"

    fill_in "order[credit_card_number]", with: "4111111111111111"
    fill_in "order[expiration_month]", with: 12
    fill_in "order[expiration_year]", with: 25
    fill_in "order[shipping_name]", with: "Pat Jones"
    fill_in "order[address]", with: "123 Any St"
    fill_in "order[zipcode]", with: 83701
    fill_in "order[child_full_name]", with: "Kim Jones"
    fill_in "order[child_birthdate]", with: "2019-03-03"

    click_on "Purchase"

    expect(page).to have_content("Thanks for Your Order")
    expect(page).to have_content(Order.last.user_facing_id)
    expect(page).to have_content("Kim Jones")


  end

  scenario "Tells us when there was a problem charging our card" do
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

    click_on "Buy Now $10.00"

    fill_in "order[credit_card_number]", with: "4242424242424242"
    fill_in "order[expiration_month]", with: 12
    fill_in "order[expiration_year]", with: 25
    fill_in "order[shipping_name]", with: "Pat Jones"
    fill_in "order[address]", with: "123 Any St"
    fill_in "order[zipcode]", with: 83701
    fill_in "order[child_full_name]", with: "Kim Jones"
    fill_in "order[child_birthdate]", with: "2019-03-03"

    click_on "Purchase"

    expect(page).not_to have_content("Thanks for Your Order")
    expect(page).to have_content("Problem with your order")
    expect(page).to have_content(Order.last.user_facing_id)
    expect(page).to have_content("Kim Jones")
  end
end
