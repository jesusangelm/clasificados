class NotificationMailer < ApplicationMailer

  def keyword_found(classified, user)
    @classified = classified
    @user = user

    mail(to: @user.email, subject: "Clasificado encontrado")
  end

end
