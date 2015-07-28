class UsersController < ApplicationController
    def index
        @users = Deal.all
		if params[:q]
			@users = User.where("email LIKE ?", "%#{params[:q]}%")
		else
		   @users = User.all
		end
    end
    
    def show
        @user = User.find(params[:id])
    end
    
    def edit
        @user = User.find(params[:id])
    end 
    
    def update
		@user = User.find(params[:id])

		if @user.update(edit_user_params)
			redirect_to user_path(@user)
		else
			render :edit
		end
	end
	def destroy
		@user = User.find(params[:id])
		@user.destroy

		redirect_to users_path
	end
	private
    	def edit_user_params
    		params.require(:user).permit(:account_name, :merchant_id, :role)
    	end
    end


