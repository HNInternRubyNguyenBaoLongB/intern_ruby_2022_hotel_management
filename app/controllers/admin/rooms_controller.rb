class Admin::RoomsController < Admin::AdminController
  def index; end

  def new
    @room = Room.new
    @room.images.build
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to admin_rooms_path
      flash[:success] = t ".alert"
    else
      flash.now[:danger] = t ".alert_not_save"
      render :new
    end
  end

  private
  def room_params
    params.require(:room).permit(:name, :description, :price,
                                 images_attributes:
                                 [:id, :photo, :_destroy])
  end
end
