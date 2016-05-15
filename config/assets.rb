module Site
  module Assets
    def self.environment root_path
      @environment ||= (Sprockets::Environment.new root_path).tap do |env|
        env.append_path 'assets/javascripts'
        env.css_compressor = :scss
        env.append_path 'assets/stylesheets'
        AutoprefixerRails.install(env)
      end
    end
  end
end
