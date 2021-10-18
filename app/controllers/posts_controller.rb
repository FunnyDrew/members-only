class PostsController < ApplicationController

  before_action :authenticate_user!, only:[:new]

  def new
    @post = Post.new
  end

  def create
        #@user = User.new(username: params[:username], email: params[:email], password: params[:password])
        @user = current_user
        
        @post = Post.new(title: params[:post][:title], user_id: @user[:id])   
        
        if @post.save
            redirect_to posts_path
        else
            render :new
        end
    end

  def index
    @posts = Post.all
    @render_post = []
    @posts.each do |post|
      puts author = user_signed_in?
    end
  end

  private

end
