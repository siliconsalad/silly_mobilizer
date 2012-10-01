require 'spec_helper'

describe SillyMobilizer::MobileRequestsHandler do
  class MockController < ActionController::Base
    include SillyMobilizer::MobileRequestsHandler
  end

  subject { MockController.new }

  describe "#handle_mobile" do

    before(:each) do
      @request = stub("request", user_agent: "android", format: @format, formats: @formats, xhr?: false)
      subject.stub(:request).and_return(@request)
    end

    it 'should return nil if request is not a mobile request' do
      subject.stub(:session).and_return({})
      subject.stub(:mobile_request?).and_return(false)
      subject.send(:handle_mobile).should be_nil
    end

    context "the request is a mobile request" do
      before(:each) do
        subject.stub(:session).and_return({})
        subject.stub(:mobile_request?).and_return(true)
        @format  = :old_format
        @formats = []
        @request.stub(:format=).and_return { |new_value| @format = new_value }
      end

      context "user forced desktop version" do
        it 'should not modify request.format' do
          subject.stub(:session).and_return(device_type_override: :desktop)
          subject.send(:handle_mobile)
          @format.should == :old_format
        end
      end

      it "should set request.format to :mobile" do
        subject.send(:handle_mobile)
        @format.should == :mobile
      end

    end

  end

end
