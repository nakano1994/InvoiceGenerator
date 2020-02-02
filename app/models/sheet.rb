class Sheet < ApplicationRecord
  belongs_to :user, optional: true
  has_many :answers, dependent: :destroy
end
