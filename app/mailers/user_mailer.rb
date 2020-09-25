class UserMailer < ApplicationMailer
    def password_reset(user)
        @user = user
        @url = 'http://localhost:3000/password_reset'
        mail(to: @user.email, subject: 'Reset Password')
    end
end
