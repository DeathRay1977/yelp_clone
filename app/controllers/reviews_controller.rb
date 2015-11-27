class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    if current_user
      @restaurant = Restaurant.find(params[:restaurant_id])
      p = review_params
      p["user_id"] = current_user.id
      @restaurant.reviews.create(p)
      redirect_to restaurants_path
    else
      redirect_to restaurants_path, :flash =>
      { :notice => "Insufficient rights!"  }
    end
  end

  def review_params
    params.require(:review).permit(:thoughts, :rating)
  end
end
