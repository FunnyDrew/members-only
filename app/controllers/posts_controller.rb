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
    @rendered_posts = []
    @posts.each do |post|
      author_email = user_signed_in? ? User.find(post[:user_id])[:email] : "unonymous"
      post_info = {author_email: author_email, title: post[:title]}
      @rendered_posts << (post_info)
    end
    @rendered_posts
  end

  private

end
