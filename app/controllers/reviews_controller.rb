class ReviewsController < ApplicationController
  def create
	@restaurant = Restaurant.find(params[:restaurant_id])
	@review = @restaurant.reviews.build(review_params)
	if @review.save
	  redirect_to @restaurant
	else
	  render 'restaurants/show', status: :unprocessable_entity
	end
  end

  private

  def review_params
	params.require(:review).permit(:rating, :content)
  end
end
