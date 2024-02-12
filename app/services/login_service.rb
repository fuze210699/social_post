class LoginService
  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    user = User.find_by(email: email)
    return nil unless user
    return user if user.authenticate(password)

    nil
  end

  private

  attr_reader :email, :password

end
