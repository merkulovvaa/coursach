class SpecsController < ApplicationController
  def index
    @specs = Spec.all
  end

  def show
    @spec = Spec.find(params[:id])
  end

  def new
    @spec = Spec.new
  end

  def create
    @spec = Spec.new(spec_params)

    if @spec.save
      redirect_to @spec
    else
      render :new
    end
  end

  def edit
    @spec = Spec.find(params[:id])
  end

  def update
    @spec = Spec.find(params[:id])

    if @spec.update(spec_params)
      redirect_to @spec
    else
      render :edit
    end
  end

  def destroy
    @spec = Spec.find(params[:id])
    @spec.destroy

    redirect_to specs_path
  end

  private

  def spec_params
    params.require(:spec).permit(:name_spec)
  end
end