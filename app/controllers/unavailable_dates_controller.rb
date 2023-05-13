class UnavailableDatesController < ApplicationController
  def index
    @unavailable_dates = UnavailableDate.all
  end

  def show
    @unavailable_date = UnavailableDate.find(params[:id])
  end

  def new
    @unavailable_date = UnavailableDate.new
  end

  def create
    if params[:unavailable_date][:leave_type] == "sick_leave"
      params[:unavailable_date][:leave_type] = 0
    else
      params[:unavailable_date][:leave_type] = 1
      available_amount_of_days = AmountOfVacationDaysService.call(current_doctor.id)
      start_date = Date.parse(params[:unavailable_date][:start_date])
      end_date = Date.parse(params[:unavailable_date][:end_date])
      wanted_amount = (end_date - start_date).to_i
      if available_amount_of_days < wanted_amount
        flash[:error] = "Вы не можете взять больше #{available_amount_of_days} дней отпуска"
        redirect_to new_unavailable_date_path
        return
      end
    end

    @unavailable_date = UnavailableDate.new(unavailable_date_params)

    if @unavailable_date.valid? && @unavailable_date.save
      redirect_to @unavailable_date
    else
      flash[:error] = @unavailable_date.errors.full_messages.join(", ")
      redirect_to new_unavailable_date_path
    end
  end

  def edit
    @unavailable_date = UnavailableDate.find(params[:id])
  end

  def update
    @unavailable_date = UnavailableDate.find(params[:id])

    if @unavailable_date.update(unavailable_date_params)
      redirect_to @unavailable_date
    else
      render :edit
    end
  end

  def destroy
    @unavailable_date = UnavailableDate.find(params[:id])
    @unavailable_date.destroy

    redirect_to unavailable_dates_path
  end

  private

  def unavailable_date_params
    params.require(:unavailable_date).permit(:start_date, :end_date, :doctor_id, :leave_type)
  end

end