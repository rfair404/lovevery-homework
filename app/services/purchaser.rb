class Purchaser
  def initialize
  end

  def purchase(order, params)
    # Fake number to force a decline
    if params[:credit_card_number] == "4242424242424242"
      return false
    end
    order.update_attribute(:paid, true)
    true
  end
end
