class CreateCardService
  def initialize(account)
    @account = account
  end

  def call
    raise "Account already has a card" if account.card.present?

    Card.create!(
      account: account,
      number: generate_card_number,
      cvv: generate_cvv,
      expiration_date: generate_expiration_date,
      limit: 5000,
      available_limit: 5000,
      status: :active
    )
  end

  private

  attr_reader :account

  def generate_card_number
    4.times.map do
      rand(1000..9999)
    end.join
  end

  def generate_cvv
    rand(100..999).to_s
  end

  def generate_expiration_date
    5.years.from_now.strftime("%m/%y")
  end
end
