# app/services/available_dates_service.rb
class AvailableDatesService
  def initialize(doctor, start_date, end_date)
    @doctor = doctor
    @start_date = start_date
    @end_date = end_date
  end

  def call
    available_dates = (@start_date..@end_date).to_a - unavailable_dates
    available_dates.reject! { |date| weekend?(date) }
    available_dates
  end

  private

  def unavailable_dates
    @doctor.unavailable_dates.where('start_date <= ? AND end_date >= ?', @end_date, @start_date).pluck(:start_date, :end_date).flat_map { |range| (range[0]..range[1]).to_a }
  end

  def weekend?(date)
    date.saturday? || date.sunday?
  end
end
