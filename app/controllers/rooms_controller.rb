class RoomsController < ApplicationController
  before_action :find_rooms, only: :show
  before_action :filter_rooms, only: :index

  def index; end

  def show; end

  private

  def find_rooms
    @room = Room.find_by id: params[:id]
    return if @room

    flash[:danger] = t ".can_not_find_tour"
    redirect_to root_path
  end

  def filter_rooms
    @pagy, @rooms = pagy Room.room_order,
                         items: Settings.room.room_per_page

    return if params[:rating].blank?

    @pagy, @rooms = pagy Room.by_rating params[:rating],
                                        items: Settings.tour.tour_per_page
  end
end
