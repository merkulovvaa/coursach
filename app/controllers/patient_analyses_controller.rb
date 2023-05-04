class PatientAnalysesController < ApplicationController
  before_action :set_patient_analysis, only: %i[ show edit update destroy ]

  # GET /patient_analyses or /patient_analyses.json
  def index
    @patient_analyses = PatientAnalysis.all
  end

  # GET /patient_analyses/1 or /patient_analyses/1.json
  def show
  end

  # GET /patient_analyses/new
  def new
    @patient_analysis = PatientAnalysis.new
  end

  # GET /patient_analyses/1/edit
  def edit
  end

  # POST /patient_analyses or /patient_analyses.json
  def create
    @patient_analysis = PatientAnalysis.new(patient_analysis_params)

    respond_to do |format|
      if @patient_analysis.save
        format.html { redirect_to patient_analysis_url(@patient_analysis), notice: "Patient analysis was successfully created." }
        format.json { render :show, status: :created, location: @patient_analysis }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @patient_analysis.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patient_analyses/1 or /patient_analyses/1.json
  def update
    respond_to do |format|
      if @patient_analysis.update(patient_analysis_params)
        format.html { redirect_to patient_analysis_url(@patient_analysis), notice: "Patient analysis was successfully updated." }
        format.json { render :show, status: :ok, location: @patient_analysis }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @patient_analysis.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patient_analyses/1 or /patient_analyses/1.json
  def destroy
    @patient_analysis.destroy

    respond_to do |format|
      format.html { redirect_to patient_analyses_url, notice: "Patient analysis was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient_analysis
      @patient_analysis = PatientAnalysis.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def patient_analysis_params
      params.require(:patient_analysis).permit(:analysis_id, :analysis_date)
    end
end
