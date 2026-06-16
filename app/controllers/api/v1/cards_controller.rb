module Api
  module V1
    class CardsController < ApplicationController
      skip_before_action :authenticate_user!
      skip_before_action :verify_authenticity_token
      before_action :authenticate_internal_request!

      def validate
        card = Card.find_by(
          number: params[:card_number]
        )

        if card.nil?
          return render json: {
            valid: false,
            error: "Card not found"
          }, status: :unprocessable_entity
        end

        if card.cvv != params[:cvv]
          return render json: {
            valid: false,
            error: "Invalid CVV"
          }, status: :unprocessable_entity
        end

        render json: {
          valid: true,
          status: card.status,
          available_limit: card.available_limit,
          account_id: card.account_id
        }
      end
    end
  end
end
