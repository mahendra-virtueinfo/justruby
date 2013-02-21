class UsersController < ApplicationController
	before_filter :require_no_user, :only => [:new, :create]
  	before_filter :require_user, :only => [:show, :edit, :update]

	def show
		@user = @current_user
	end
		
	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			flash[:success] = "Your Registerd Successfully!"
			redirect_to @user
		else
		 	render 'new'
		end 
	end

	def save
		@user.save
	end

end
