class Account < ApplicationRecord
  belongs_to :user

  has_one :card, dependent: :destroy
  has_many :transactions, dependent: :destroy

  enum :status, {
    active: 0,
    blocked: 1
  }

  validates :balance,
    numericality: {
      greater_than_or_equal_to: 0
    }
end
