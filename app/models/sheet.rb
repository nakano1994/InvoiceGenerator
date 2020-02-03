class Sheet < ApplicationRecord
  belongs_to :user, optional: true
  has_many :answers, dependent: :destroy

  def total_price
    answers.to_a.sum{ |answer| answer.total_price }
  end
end
