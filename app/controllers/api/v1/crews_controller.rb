class Api::V1::CrewsController < Api::V1::GraphitiController
  def index
    crews = CrewResource.all(params)
    respond_with(crews)
  end

  def show
    crew = CrewResource.find(params)
    respond_with(crew)
  end

  def create
    crew = CrewResource.build(params)

    if crew.save
      render jsonapi: crew, status: :created
    else
      render jsonapi_errors: crew
    end
  end

  def update
    crew = CrewResource.find(params)

    if crew.update_attributes
      render jsonapi: crew
    else
      render jsonapi_errors: crew
    end
  end

  def destroy
    crew = CrewResource.find(params)

    if crew.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: crew
    end
  end
end
