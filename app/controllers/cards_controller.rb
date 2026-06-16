class CardsController < ApplicationController
  def create
    CreateCardService.new(
      current_user.account
    ).call

    redirect_to account_path,
      notice: "Card created successfully"
  rescue => error
    redirect_to account_path,
      alert: error.message
  end
end
