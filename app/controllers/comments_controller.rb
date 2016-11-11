class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :set_post
  before_action :set_comment, only: :destroy

  def create
    @comment = @post.comments.new(comment_params)
    @comment.save
  end

  def destroy
    @comment.destroy
  end

  def reply_destroy
    authorize_action_for @comment
    @comment.destroy
  end
  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
