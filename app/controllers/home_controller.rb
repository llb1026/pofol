class HomeController < ApplicationController
  def main
    unless user_signed_in?
      redirect_to '/users/sign_in'
    end
    @posts = Post.all.order("created_at DESC")
  end

  def mypage
    @post = Post.all
  end

end
