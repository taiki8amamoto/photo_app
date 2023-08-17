class ContactMailer < ApplicationMailer
  def contact_mail(picture, current_user)
    @contact = picture
    @current_user = current_user

    mail(to: @current_user.email, subject: "新規投稿完了")
  end
end
