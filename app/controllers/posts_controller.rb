class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    post = Post.create! params.require(:post).permit(:caption, :account_id, :image)
    post.image.attach(params[:post][:image])  
      if post.save
        flash[:success] = "The snozberries taste like snozberries!" 
        redirect_to dashboard_path
      else
        redirect_to new_post_path
      end
  end
    
  def destroy
    @post = current_account.posts.find(params[:id])
    @post.destroy
    redirect_to dashboard_path
  end

  def show
    @post = Post.find(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:caption, :image, :account_id)
  end
end
