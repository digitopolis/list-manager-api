class Api::V1::PasswordsController < ApplicationController
    def forgot
        @user = User.find_by(email: params[:email])
        if @user
            @user.generate_password_token!
            UserMailer.password_reset(@user).deliver_now
            render json: { message: 'Email sent' }, status: :ok
        else
            render json: { error: 'User not found' }, status: :not_found
        end
    end

    def reset
        @token = params[:token].to_s
        @user = User.find_by(email: params[:email])
        if @user && @token == @user.password_token
            @user.reset_password!(params[:password])
            render json: { message: 'Password updated, please proceed to log in' }, status: :accepted
        else
            render json: { error: 'Invalid or expired token '}, status: :unauthorized
        end
    end
end
