class DepositService
  def initialize(account, amount)
    @account = account
    @amount = amount.to_f
  end

  def call
    ActiveRecord::Base.transaction do
      account.update!(
        balance: account.balance + amount
      )

      Transaction.create!(
        account: account,
        transaction_type: :deposit,
        amount: amount,
        description: "Deposit into account"
      )
    end
  end

  private

  attr_reader :account, :amount
end
