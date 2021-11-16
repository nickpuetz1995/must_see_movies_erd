class Api::V1::CastsController < Api::V1::GraphitiController
  def index
    casts = CastResource.all(params)
    respond_with(casts)
  end

  def show
    cast = CastResource.find(params)
    respond_with(cast)
  end

  def create
    cast = CastResource.build(params)

    if cast.save
      render jsonapi: cast, status: :created
    else
      render jsonapi_errors: cast
    end
  end

  def update
    cast = CastResource.find(params)

    if cast.update_attributes
      render jsonapi: cast
    else
      render jsonapi_errors: cast
    end
  end

  def destroy
    cast = CastResource.find(params)

    if cast.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: cast
    end
  end
end
