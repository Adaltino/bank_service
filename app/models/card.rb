class Card < ApplicationRecord
  belongs_to :account

  enum :status, {
    active: 0,
    blocked: 1
  }

  validates :limit,
    numericality: {
      greater_than_or_equal_to: 0
    }

  validates :available_limit,
    numericality: {
      greater_than_or_equal_to: 0
    }

  def formatted_number
    number.scan(/.{1,4}/).join(" ")
  end
end
