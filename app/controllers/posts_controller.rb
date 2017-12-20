class PostsController < ApplicationController
  # before action을 통해 잠근다.
  before_action :authorize

  def index
    @posts = Post.all
    @comments = Comment.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new

  end

  def create
    Post.create(
      # 현재 접속한 유저의 정보가 들어가 있어야 함
      user_id: current_user.id,
      title: params[:title],
      content: params[:content]
    )
    redirect_to '/'
  end

  def destroy
    # 1. :id를 통해 post 안에 있는 아이디를 찾는다.
    # 2. 해당 아이디를 지워준다
    # find를 통해 파라미터 안에 있는 id를 찾는다.
    post = Post.find(params[:id])
    post.destroy

    redirect_to '/'
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    # id를 통해 post를 찾는다.
    # 그리고 그걸 업데이트 해준다.
    post = Post.find(params[:id])
    post.update(
      title: params[:title],
      content: params[:content]
    )

    redirect_to '/'
  end

  def add_comment
    Comment.create(
      user_id: current_user.id,
      content: params[:content],
      post_id: params[:id]
    )

    redirect_to :back #{}"/posts/show/#{params[:id]}"
  end

end
