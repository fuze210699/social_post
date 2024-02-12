class RegistrationService
  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    user = User.new(email: email, password: password)

    if user.save
      user
    else
      nil
    end
  end

  private

  attr_reader :email, :password
end