class Api::V1::AuthController < ApplicationController

    def create
        @user = User.find_by(email: user_login_params[:email])
        if !@user
            render json: { error: 'No account found for that email address' }, status: :not_found
        elsif @user && @user.authenticate(user_login_params[:password])
            render json: { user: UserSerializer.new(@user)}, status: :accepted
        else
            render json: { error: 'Invalid email or password' }, status: :unauthorized
        end
    end

    private
    def user_login_params
        params.permit(:email, :password)
    end
end
