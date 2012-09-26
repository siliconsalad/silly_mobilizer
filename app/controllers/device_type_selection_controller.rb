class DeviceTypeSelectionController < ActionController::Base

  def create
    session[:device_type_override] = :desktop
    redirect_to :back
  end

  def destroy
    session[:device_type_override] = nil
    redirect_to :back
  end

end
