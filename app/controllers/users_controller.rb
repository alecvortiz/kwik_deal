class UsersController < ApplicationController
    def index
        redirect_to deals_path, notice: "You need to be an admin to view that page." unless current_user && current_user.admin?
        @users = User.all
		if params[:q]
			@users = User.where("email LIKE ? or account_name LIKE ? or merchant_id = ?", "%#{params[:q]}%", "%#{params[:q]}%", params[:q].to_i)
		else
		   @users = User.all
		end
    end
    
    def show
    	redirect_to deals_path, notice: "You need to be an admin to view that page." unless current_user && current_user.admin?
        @user = User.find(params[:id])
    end
    
    def edit
    	redirect_to deals_path, notice: "You need to be an admin to view that page." unless current_user && current_user.admin?
        @user = User.find(params[:id])
    end 
    
    def update
    	redirect_to deals_path, notice: "You need to be an admin to view that page." unless current_user && current_user.admin?
		@user = User.find(params[:id])

		if @user.update(edit_user_params)
			redirect_to user_path(@user)
		else
			render :edit
		end
	end
	def destroy
		redirect_to deals_path, notice: "You need to be an admin to view that page." unless current_user && current_user.admin?
		@user = User.find(params[:id])
		@user.destroy

		redirect_to users_path
	end
	private
    	def edit_user_params
    		params.require(:user).permit(:account_name, :merchant_id, :role)
    	end
    end


