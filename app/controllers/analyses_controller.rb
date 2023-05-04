class AnalysesController < ApplicationController
  def index
    @analyses = Analysis.all
  end

  def show
    @analysis = Analysis.find(params[:id])
  end

  def new
    @analysis = Analysis.new
  end

  def create
    @analysis = Analysis.new(analysis_params)

    if @analysis.save
      redirect_to @analysis
    else
      render :new
    end
  end

  def edit
    @analysis = Analysis.find(params[:id])
  end

  def update
    @analysis = Analysis.find(params[:id])

    if @analysis.update(analysis_params)
      redirect_to @analysis
    else
      render :edit
    end
  end

  def destroy
    @analysis = Analysis.find(params[:id])
    @analysis.destroy

    redirect_to analyses_path
  end

  private

  def analysis_params
    params.require(:analysis).permit(:name_analysis)
  end
end