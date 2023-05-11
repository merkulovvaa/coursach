class OutpatientCardsController < ApplicationController
  def index
    @outpatient_cards = OutpatientCard.all
  end

  def show
    @outpatient_card = OutpatientCard.find(params[:id])
  end

  def new
    @outpatient_card = OutpatientCard.new
  end

  def create
    @outpatient_card = OutpatientCard.new(outpatient_card_params)

    if @outpatient_card.save
      redirect_to @outpatient_card
    else
      render :new
    end
  end

  def edit
    @outpatient_card = OutpatientCard.find(params[:id])
  end

  def update
    @outpatient_card = OutpatientCard.find(params[:id])

    if @outpatient_card.update(outpatient_card_params)
      redirect_to @outpatient_card
    else
      render :edit
    end
  end

  def destroy
    @outpatient_card = OutpatientCard.find(params[:id])
    @outpatient_card.destroy

    redirect_to outpatient_cards_path
  end

  private

  def outpatient_card_params
    params.require(:outpatient_card).permit(:patient_id)
  end
end