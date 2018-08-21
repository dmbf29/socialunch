class LunchRequestsController < ApplicationController
  def new
    @lunch_request = LunchRequest.new
    authorize @lunch_request
  end

  def create
    @lunch_request = LunchRequest.new(lunch_request_params)
    @lunch_request.user = current_user
    authorize @lunch_request
    if @lunch_request.save
      redirect_to lunch_request_path(@lunch_request)
    else
      render :new
    end
  end

  def show
    @lunch_request = LunchRequest.find(params[:id])
    authorize @lunch_request

  end

  def destroy
    lunch_request = LunchRequest.find(params[:id])
    lunch_request.destroy
    redirect_to root_path
  end

  private
  def lunch_request_params
    params.require(:lunch_request).permit(:datetime, :suggested_duration, :lunch_type)
  end
end
