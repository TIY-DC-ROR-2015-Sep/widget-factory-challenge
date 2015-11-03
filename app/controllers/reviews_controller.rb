class ReviewsController < ApplicationController
  def create
    widget = Widget.find params[:widget_id]
    x = widget.reviews.new review_params
    x.author ||= "Anonymous Coward"

    if x.save
      head :ok
    else
      head 422
    end
  end

  private

  def review_params
    params.permit(:message, :author, :stars)
  end
end
