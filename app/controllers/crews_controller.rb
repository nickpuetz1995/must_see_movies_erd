class CrewsController < ApplicationController
  before_action :set_crew, only: %i[show edit update destroy]

  def index
    @q = Crew.ransack(params[:q])
    @crews = @q.result(distinct: true).includes(:movie,
                                                :director).page(params[:page]).per(10)
  end

  def show; end

  def new
    @crew = Crew.new
  end

  def edit; end

  def create
    @crew = Crew.new(crew_params)

    if @crew.save
      message = "Crew was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @crew, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @crew.update(crew_params)
      redirect_to @crew, notice: "Crew was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @crew.destroy
    message = "Crew was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to crews_url, notice: message
    end
  end

  private

  def set_crew
    @crew = Crew.find(params[:id])
  end

  def crew_params
    params.require(:crew).permit(:movie_id, :director_id)
  end
end
