module Api
  module V1
    class UsersController < BaseController

      def create

        @proc_code = Proc.new do
          @user = User.new(user_params)
          @user.email = user_params[:email].downcase
          if @user.valid?
            @user.save
            session[:user_id] = @user.id
            @alert = "Account has been created successfully"
            @data = @user
          else
            @success = false
            @alert = "Unable to create an account"
            @errors = @user.errors
          end
        end
      end


    def user_params
      params.require(:user).permit(:user_name, :first_name, :last_name, :email, :password, :password_confirmation, :auth_token, :address, :phone)
    end

  end
end
end