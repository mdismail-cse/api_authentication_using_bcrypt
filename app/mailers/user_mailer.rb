class UserMailer < ApplicationMailer
  default from: "abc@abc.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(token,user)

    @user = user
    @token = token

    # mail to: @user.email , subject: "password reset link"
    mail to: "mdshalauddin337@gmail.com", subject: "password reset link"

  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject
  #
  def account_activation(token, user)
    @token = token
    @user = user

    mail to: @user.email, subject: "Account activation"
    # mail to: "mdshalauddin337@gmail.com", subject: "Account activation"


  end
end
