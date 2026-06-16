module Api
  module V1
    class TransactionsController < ApplicationController
      skip_before_action :authenticate_user!
      skip_before_action :verify_authenticity_token
      before_action :authenticate_internal_request!

      def debit
        card = Card.find_by(number: params[:card_number])

        if card.account.balance < params[:amount].to_f
          return render json: {
            success: "refused",
            error: "Insufficient balance"
          }, status: :unprocessable_entity
        end

        WithdrawService.new(card.account, params[:amount]).call

        render json: {
          status: "approved"
        }
      end

      def credit
        card = Card.find_by(number: params[:card_number])

        if card.available_limit < params[:amount].to_f
          return render json: {
            success: "refused",
            error: "Insufficient limit"
          }, status: :unprocessable_entity
        end

        card.update!(available_limit: card.available_limit - params[:amount].to_f)

        render json: {
          status: "approved"
        }
      end
    end
  end
end
