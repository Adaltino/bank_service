class PaymentService
  BASE_URL = ENV["PAYMENT_API_URL"]

  def payment_by_token(pix_code)
    response = Faraday.get(
      "#{BASE_URL}/pix/#{pix_code}",
      {},
      headers
    )
    JSON.parse(response.body)
  end

  def confirm_pix_payment(pix_code)
    response = Faraday.post(
      "#{BASE_URL}/pix/#{pix_code}/confirm",
      headers
    )
    JSON.parse(response.body)
  end

  private

  def headers
    {
      "Content-Type" => "application/json",
      "Authorization" =>
        "Bearer #{ENV['PAYMENT_API_TOKEN']}"
    }
  end
end
