require 'spec_helper'

describe DeviceTypeSelectionController do

  before(:each) do
    controller.request.env['HTTP_REFERER'] = root_path
  end

  describe 'create' do
    it 'sets the device type override to :desktop in session' do
      controller.session[:device_type_override].should be_blank
      post :create
      controller.session[:device_type_override].should == :desktop
    end
  end

  describe 'destroy' do
    it 'unsets the device type override in session' do
      controller.session[:device_type_override] = :desktop
      delete :destroy
      controller.session[:device_type_override].should be_blank
    end
  end

end
