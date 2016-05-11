module Site
  module Assets
    def self.environment root_path
      environment = Sprockets::Environment.new root_path

      environment.append_path 'assets/javascripts'

      environment.css_compressor = :scss
      environment.append_path 'assets/stylesheets'

      environment
    end
  end
end
