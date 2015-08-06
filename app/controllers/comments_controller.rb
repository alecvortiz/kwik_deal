class CommentsController < ApplicationController
	def create
		@deal = Deal.find(params[:deal_id])
		@comment = @deal.comments.create(comment_params)
		redirect_to [@user, @deal]
	end

	def destroy
		@deal = Deal.find(params[:deal_id])
		@comment = @deal.comments.find(params[:id])
		@comment.destroy
		redirect_to [@user, @deal]
	end
	
	def edit
		@deal = Deal.find params[:deal_id]
		@new_comment = @deal.comments.find params[:id]		
	end
	
	def update 
		@deal = Deal.find params[:deal_id]
		@comment = @deal.comments.find params[:id]
		if @comment.update(comment_params)
			redirect_to [@user, @deal]
		else
			render 'edit'
		end
	end

	private
		def comment_params
			params.require(:comment).permit(:body)
		end
end