class Transaction < ApplicationRecord
  belongs_to :account

  enum :transaction_type, {
    deposit: 0,
    withdraw: 1,
    payment: 2
  }

  validates :amount,
    numericality: {
      greater_than: 0
    }
end
