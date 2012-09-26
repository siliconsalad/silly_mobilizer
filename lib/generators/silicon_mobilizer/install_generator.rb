require 'rails/generators'
module SiliconMobilizer
  class InstallGenerator < Rails::Generators::Base
    desc "Installs the required files for the mobilizer to work with your Rails application"

    def self.source_root
      @source_root ||= File.join(File.dirname(__FILE__), 'templates')
    end

    def copy_initializer_file
      copy_file "mobile_identifiers.yml", "config/silicon_mobilizer/mobile_identifiers.yml"
    end

  end
end
