Dir['./config/*.rb'].each { |file| require file }

require 'bundler'
# Bundler.require(:default, ENV['RACK_ENV'].to_sym)
Bundler.require(:default, :development)

module Site
  class Application < Sinatra::Application
    configure do
      enable :static, :method_override

      set :logger, Logger.new("logs/#{environment}.log")
      settings.logger.level = Logger::INFO

      set :assets, Site::Assets.environment(settings.root)
    end

    get '/' do
      slim :index
    end

    get '*' do
      redirect to('/')
    end

    helpers do
      def asset_path(file)
        "assets/#{settings.assets[file].digest_path}"
      end
    end

    use Rack::Deflater
  end
end
