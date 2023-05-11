class GendersController < ApplicationController
  def index
    @genders = Gender.all
  end

  def show
    @gender = Gender.find(params[:id])
  end

  def new
    @gender = Gender.new
  end

  def create
    @gender = Gender.new(gender_params)

    if @gender.save
      redirect_to @gender
    else
      render :new
    end
  end

  def edit
    @gender = Gender.find(params[:id])
  end

  def update
    @gender = Gender.find(params[:id])

    if @gender.update(gender_params)
      redirect_to @gender
    else
      render :edit
    end
  end

  def destroy
    @gender = Gender.find(params[:id])
    @gender.destroy

    redirect_to genders_path
  end

  private

  def gender_params
    params.require(:gender).permit(:name_gender)
  end
end