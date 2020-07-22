class PostsController < ApplicationController
    before_action :find_post, only: [:show, :edit, :update, :destroy, :default_body]
    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end

    def create
        @post= Post.new(post_params)
        if @post.save
            redirect_to post_path(@post), :notice => "User saved"
        else
            render 'new'
        end
    end

    def show
    end

    def edit
    end

    def delete_all
        Post.delete_all
        redirect_to root_path
    end

    def default_body
        @post.body="this is default body"

        if @post.save
            redirect_to @post #same as post_path(@path)
        else
            render 'show'
        end

    end

    def update
        if @post.update(post_params)
            redirect_to post_path(@post)
        else
            render 'edit'
        end
    end

    def destroy
        @post.destroy
        redirect_to root_path
    end

    private
      def post_params
          params.require(:post).permit(:title, :body)
      end

      def find_post
          @post=Post.find(params[:id])
      end

end
