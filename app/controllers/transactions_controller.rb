class TransactionsController < ApplicationController
  def new_deposit
  end

  def deposit
    DepositService.new(
      current_user.account,
      params[:amount]
    ).call

    redirect_to account_path,
      notice: "Deposit completed"
  end

  def new_withdraw
  end

  def withdraw
    WithdrawService.new(
      current_user.account,
      params[:amount]
    ).call

    redirect_to account_path,
      notice: "Withdraw completed"
  rescue => error
    redirect_to account_path,
      alert: error.message
  end
end
