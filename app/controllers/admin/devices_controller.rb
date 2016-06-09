class Admin::DevicesController < ApplicationController
  def index
    @devices = Device.all
  end

  def edit
    @device = Device.find_by(id: params[:id])
  end

  def update
    device = Device.find(params[:id])
    if device.update(device_params)
      redirect_to admin_devices_path
    else
      render edit_admin_device_path(params[:id])
    end
  end

  private
  def device_params
    params.require(:device).permit(:device_code, :nickname, :role)
  end
end