class CastsController < ApplicationController
  before_action :set_cast, only: %i[show edit update destroy]

  def index
    @q = Cast.ransack(params[:q])
    @casts = @q.result(distinct: true).includes(:movie,
                                                :actor).page(params[:page]).per(10)
  end

  def show; end

  def new
    @cast = Cast.new
  end

  def edit; end

  def create
    @cast = Cast.new(cast_params)

    if @cast.save
      message = "Cast was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @cast, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @cast.update(cast_params)
      redirect_to @cast, notice: "Cast was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @cast.destroy
    message = "Cast was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to casts_url, notice: message
    end
  end

  private

  def set_cast
    @cast = Cast.find(params[:id])
  end

  def cast_params
    params.require(:cast).permit(:movie_id, :actor_id)
  end
end
