class CreateAccountService
  def initialize(user)
    @user = user
  end

  def call
    Account.create!(
      user: user,
      balance: 0,
      status: :active
    )
  end

  private

  attr_reader :user
end
