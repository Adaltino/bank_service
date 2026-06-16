class PixController < ApplicationController
  def new
  end

  def validate
    response = payment_api.payment_by_token(params[:pix_code])

    @payment = response
    @pix_code = params[:pix_code]

    render :confirm
  end

  def pay
    payment = payment_api.payment_by_token(params[:pix_code])

    WithdrawService.new(current_user.account, payment["amount"].to_f).call

    payment_api.confirm_pix_payment(params[:pix_code])

    redirect_to account_path, notice: "PIX paid successfully"
  end

  private

  def payment_api
    @payment_api ||= PaymentService.new
  end
end
