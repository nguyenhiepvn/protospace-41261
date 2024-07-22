class CommentsController < ApplicationController
  def create
    
    if Comment.new(comment_params).save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end 

  end
  
  def comment_params
    params.require(:comment).permit(:content).merge(prototype_id: params[:prototype_id], user_id: current_user.id)
  end
end
