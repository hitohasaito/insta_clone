class InstagramMailer < ApplicationMailer
    def instagram_mail(instagram)
      @instagram = instagram
      mail to: "ghdhdrnap6@gmail.com", subject: "新規投稿お知らせ"
    end
end
