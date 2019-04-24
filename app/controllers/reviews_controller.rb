class ReviewsController < ApplicationController
  before_filter :authorize

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(reviews_params)
    @review.user = current_user

    if @review.save
      redirect_to product_path(@product)
    else
      render 'products/show'
    end

  end

  def destroy
    @product = Product.find params[:id]
    @review = @product.reviews.find(reviews_params)
    @review.destroy
    redirect_to product_path(@product), notice: 'Review deleted!'
  end

  private
  def reviews_params
    params.require(:review).permit(
      :description, :rating
    )
  end
end
