class Answer < ApplicationRecord
  
  def total_price
    price * quantity
  end
end
