class UserMailer < ApplicationMailer
  default from: "abc@abc.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(token)

    # @user = params[:user]
    @token = token

    mail to: "mdshalauddin337@gmail.com", subject: "password reset link"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activarion.subject
  #
  def account_activarion
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
