# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/password_reset
  def password_reset
    UserMailer.password_reset
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/account_activarion
  def account_activarion
    UserMailer.account_activarion
  end

end
