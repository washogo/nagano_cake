module ApplicationHelper
  def addTax(money,rate)
    _taxed_money =  (money*rate).round
  end

  def subtotal(money,amount)
    _subtotal=(money*amount).round
  end
end
