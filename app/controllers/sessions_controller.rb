class SessionsController < Devise::SessionsController
	skip_before_action :verify_authenticity_token, only: [:create]
	def new
		@user = User.new
	end

	def create
		if params[:commit].nil?
			@user = User.find_by_email(params[:email])
			if @user != nil
				sign_in @user
				redirect_to root_path
			else
				User.create(email: params[:email], role: params[:role], name: params[:name], password:"123456")
				sign_in @user
				redirect_to root_path
			end

		else
			@user = User.find_by_email(params[:user][:email])
			if @user != nil
				sign_in @user
				redirect_to root_path
			else
				redirect_to '/users/sign_in'
			end
		end
	end
end