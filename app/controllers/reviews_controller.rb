class ReviewsController < ApplicationController


  def new
    @airport = Airport.find(params[:airport_id])
    @review = Review.new
  end

  def create
    @airport = Airport.find(params[:airport_id])
    @review = Review.new(review_params)
    @review.airport = @airport

    if @review.save
      flash[:notice] = "Review added successfully"
      redirect_to @airport
    else
      flash[:error] = "There were problems with your review."
      @errors = @review.errors.full_messages
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
