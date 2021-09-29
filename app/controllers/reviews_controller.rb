class ReviewsController < ApplicationController
def new
@post = Post.find(params[:post_id])
@review = Review.new
end

def create
    @review = Review.new(review_params)
    @post = Post.find(params[:post_id])
    @review.user = current_user
    @review.post = @post
    if @review.save
      redirect_to posts_path(@post)
    else
      flash[:notice] = "Something went wrong... Please try again! 👍"
      redirect_to posts_path(@post)
    end
end

def edit
end

def update
 @review.update(review_params)
 redirect_to reviews_path(@review)
end

# def destroy
# @review.destroy
# redirect_to reviews_path
# end

private

def review_params
  params.require(:review)
        .permit(:title, :body, :user_id, :post_id)
end

def set_post
  @post = Post.find(params[:post_id])
end


end
