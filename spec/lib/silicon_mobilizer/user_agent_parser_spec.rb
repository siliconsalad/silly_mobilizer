# encoding: UTF-8
require 'spec_helper'

AGENTS = YAML.load_file(File.dirname(__FILE__) + '/../../support/user_agents.yml')['user_agents']

describe SiliconMobilizer::UserAgentParser do

  let(:parser) { SiliconMobilizer::UserAgentParser.new }

  describe '#type' do
    AGENTS.each do |key, data|
      it "returns #{data[:type]} for #{key}" do
        parser.ua = data[:string]
        parser.type.should == data[:type]
      end
    end
  end

  describe '#mobile?' do
    AGENTS.each do |key, data|
      it "returns #{data[:type] == :mobile} for #{key}" do
        parser.ua = data[:string]
        parser.mobile?.should == (data[:type] == :mobile)
      end
    end
  end

  describe '#desktop?' do
    AGENTS.each do |key, data|
      it "returns #{data[:type] == :desktop} for #{key}" do
        parser.ua = data[:string]
        parser.desktop?.should == (data[:type] == :desktop)
      end
    end
  end

end
