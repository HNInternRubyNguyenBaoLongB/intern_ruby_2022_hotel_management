class RoomsController < ApplicationController
  before_action :find_rooms, only: :show
  before_action :check_blank_date, :check_date, only: :index

  def index
    @pagy, @rooms = pagy Room.not_ids(
      Room.by_between_date(params[:start_date],
                           params[:end_date])
    )
                             .by_description(params[:description]),
                         items: Settings.room.room_per_page
  end

  def show; end

  private

  def find_rooms
    @room = Room.find_by id: params[:id]
    return if @room

    flash[:danger] = t ".can_not_find_room"
    redirect_to root_path
  end

  def check_date
    return if params[:start_date] < params[:end_date]

    flash[:danger] = t ".date_danger"
    @pagy, @rooms = pagy Room.room_order, items: Settings.room.room_per_page
    redirect_to root_path
  end

  def init_date
    params[:start_date] =
      params[:start_date].presence || DateTime.now.to_date
    params[:end_date] =
      params[:end_date].presence ||
      Settings.day.day_from_now.days.from_now.to_date
  end

  def check_blank_date
    init_date
    return if params[:start_date].present? && params[:end_date].present?

    @pagy, @rooms = pagy Room.room_order, items: Settings.room.room_per_page
    render :index
  end
end
