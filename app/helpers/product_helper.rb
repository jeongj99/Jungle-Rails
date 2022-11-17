module ProductHelper
  def stock_empty?
    self[:quantity] == 0
  end
end
