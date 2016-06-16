class AirportsController < ApplicationController

  def index
    @airports = Airport.all
  end

  def new
    @airport = Airport.new
  end

  def show
    @airport = Airport.find(params[:id])
    @reviews = @airport.reviews
  end

  def create
    @airport = Airport.new(airport_params)

    if(@airport.save)
      flash[:notice] = "Airport added successfully"
      redirect_to @airport
    else
      flash[:error] = "Problems with your airport"
      @errors = @airport.errors.full_messages
      render :new
    end
  end

  private

  def airport_params
    params.require(:airport).permit(:name, :city, :state, :description)
  end

end
