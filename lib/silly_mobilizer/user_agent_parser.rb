module SillyMobilizer
  class UserAgentParser

    attr_accessor :user_agent_string

    alias :ua :user_agent_string
    alias :ua= :user_agent_string=

    def initialize(user_agent_string='')
      @mobile_identifiers = YAML.load_file(Rails.root.join('config', 'silly_mobilizer', 'mobile_identifiers.yml'))
      @user_agent_string  = user_agent_string
    end

    def desktop?
      self.type == :desktop
    end

    def mobile?
      self.type == :mobile
    end

    def type
      @user_agent_string.downcase =~ Regexp.union(@mobile_identifiers) ? :mobile : :desktop
    end

  end
end
