class UserMailer < ApplicationMailer
    def password_reset(user)
        @user = user
        @url = 'http://localhost:3000/reset-password'
        mail(to: @user.email, subject: 'Reset Password')
    end
end
