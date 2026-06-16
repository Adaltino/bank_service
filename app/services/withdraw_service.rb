class WithdrawService
  def initialize(account, amount)
    @account = account
    @amount = amount.to_f
  end

  def call
    raise "Insufficient balance" if insufficient_balance?

    ActiveRecord::Base.transaction do
      account.update!(balance: account.balance - amount)

      Transaction.create!(
        account: account,
        transaction_type: :withdraw,
        amount: amount,
        description: "Withdraw from account"
      )
    end
  end

  private

  attr_reader :account, :amount

  def insufficient_balance?
    account.balance < amount
  end
end
