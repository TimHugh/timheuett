Dir['./config/*.rb'].each { |file| require file }

require 'bundler'
Bundler.require(:default, ENV['RACK_ENV'].to_sym)

module Site
  class Application < Sinatra::Application
    configure do
      enable :static, :method_override

      set :logger, Logger.new("logs/#{environment}.log")
      settings.logger.level = Logger::INFO

      set :assets, Site::Assets.environment(settings.root)
    end

    def render_index
      @page_class = 'index'
      slim :index
    end

    get '/' do
      render_index
    end

    get '*' do
      status 404
      render_index
    end

    helpers do
      def asset_path(file)
        "assets/#{settings.assets[file].digest_path}"
      end

      def page_class
        @page_class
      end
    end

    use Rack::Deflater
  end
end
