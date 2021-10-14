module ApplicationHelper
  def addTax(money,rate)
    _taxed_money =  (money*rate).round
  end
end
