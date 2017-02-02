class PostsController < ApplicationController

  def main
    unless user_signed_in?
      redirect_to '/users/sign_in'
    end
    @posts = Post.all.paginate(page: params[:page], per_page: 5).order("created_at DESC")
    #@posts = Post.order("created_at DESC")
  end

  def mypage
    @post = Post.all
  end

  def show
    @post = Post.find(params[:id])
    session[:return_to] = request.fullpath
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path, notice: "The post has been successfully created."
    else
      render action: "new"
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to session[:return_to], notice: "The post has been successfully updated."
      #redirect_to root_path, notice: "The post has been successfully updated."
    else
      render action: "edit"
    end
  end

  def destroy
    @trash = Post.find(params[:id])
    @trash.destroy
    redirect_to root_path, notice: "The post has been successfully deleted."
  end

  def upvote
    @link = Post.find(params[:id])
    @link.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @link = Post.find(params[:id])
    @link.downvote_by current_user
    redirect_to :back
  end

  def write_reply
    reply = Reply.new
    reply.content = params[:content]
    reply.post_id = params[:post_id]
    reply.username = params[:username]
    reply.save

    redirect_to :back
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :username)
  end

end
