class DeviceInfosController < ApplicationController
  def create
    device = Device.create(user_id: params[:user_id], token: params[:token], device_type: params[:device_type])
  end
end
