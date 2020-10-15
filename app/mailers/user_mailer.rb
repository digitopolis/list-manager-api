class UserMailer < ApplicationMailer
    def password_reset(user)
        @user = user
        @url = 'https://mm-list-manager-app.herokuapp.com/reset-password'
        mail(to: @user.email, subject: 'Reset Password')
    end
end
