class PostsController < ApplicationController
  def index
    @posts = Post.all.reverse
  end

  def new

  end

  def create
    Post.create(
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

end
