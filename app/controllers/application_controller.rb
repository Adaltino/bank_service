class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :authenticate_user!

  private

  def authenticate_internal_request!
    token = request.headers["Authorization"]

    expected_token = "Bearer #{ENV['BANK_API_TOKEN']}"

    return if token == expected_token

    render json: {
      error: "Unauthorized"
    }, status: :unauthorized
  end
end
