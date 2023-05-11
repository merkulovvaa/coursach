class PatientAnalysesController < ApplicationController
  def index
    @patient_analyses = PatientAnalysis.all
  end

  def show
    @patient_analysis = PatientAnalysis.find(params[:id])
  end

  def new
    @patient_analysis = PatientAnalysis.new
  end

  def create
    @patient_analysis = PatientAnalysis.new(patient_analysis_params)

    if @patient_analysis.save
      redirect_to @patient_analysis
    else
      render :new
    end
  end

  def edit
    @patient_analysis = PatientAnalysis.find(params[:id])
  end

  def update
    @patient_analysis = PatientAnalysis.find(params[:id])

    if @patient_analysis.update(patient_analysis_params)
      redirect_to @patient_analysis
    else
      render :edit
    end
  end

  def destroy
    @patient_analysis = PatientAnalysis.find(params[:id])
    @patient_analysis.destroy

    redirect_to patient_analyses_path
  end

  private

  def patient_analysis_params
    params.require(:patient_analysis).permit(:analysis_id, :appointment_id, :analysis_date)
  end
end