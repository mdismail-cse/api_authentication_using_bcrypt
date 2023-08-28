class User < ApplicationRecord
  has_secure_password

  # after_save :send_mail
  #
  # def send_mail
  #   UserMailer.password_reset(self).deliver_now
  # end

end
