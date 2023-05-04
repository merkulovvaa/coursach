class OutpatientCardsController < ApplicationController
  before_action :set_outpatient_card, only: %i[ show edit update destroy ]

  # GET /outpatient_cards or /outpatient_cards.json
  def index
    @outpatient_cards = OutpatientCard.all
  end

  # GET /outpatient_cards/1 or /outpatient_cards/1.json
  def show
  end

  # GET /outpatient_cards/new
  def new
    @outpatient_card = OutpatientCard.new
  end

  # GET /outpatient_cards/1/edit
  def edit
  end

  # POST /outpatient_cards or /outpatient_cards.json
  def create
    @outpatient_card = OutpatientCard.new(outpatient_card_params)

    respond_to do |format|
      if @outpatient_card.save
        format.html { redirect_to outpatient_card_url(@outpatient_card), notice: "Outpatient card was successfully created." }
        format.json { render :show, status: :created, location: @outpatient_card }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @outpatient_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /outpatient_cards/1 or /outpatient_cards/1.json
  def update
    respond_to do |format|
      if @outpatient_card.update(outpatient_card_params)
        format.html { redirect_to outpatient_card_url(@outpatient_card), notice: "Outpatient card was successfully updated." }
        format.json { render :show, status: :ok, location: @outpatient_card }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @outpatient_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /outpatient_cards/1 or /outpatient_cards/1.json
  def destroy
    @outpatient_card.destroy

    respond_to do |format|
      format.html { redirect_to outpatient_cards_url, notice: "Outpatient card was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_outpatient_card
      @outpatient_card = OutpatientCard.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def outpatient_card_params
      params.require(:outpatient_card).permit(:patient_id, :appointment_id)
    end
end
