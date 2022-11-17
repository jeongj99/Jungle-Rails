module ProductHelper
  def stock_empty?
    if self[:quantity] == 0
      true
    else
      false
    end
  end
end
