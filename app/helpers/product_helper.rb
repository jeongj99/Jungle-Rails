module ProductHelper
  def stock_empty?(product_quantity)
    if product_quantity == 0
      true
    else
      false
    end
  end
end
