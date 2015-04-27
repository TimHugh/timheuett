Dir['./config/*.rb'].each { |file| require file }

require 'bundler'
Bundler.require

module Site
  class Application < Sinatra::Application
    configure do
      enable :static, :method_override
      set root: File.dirname(__FILE__)

      set :sprockets, Site::Assets.environment(settings.root)
      set :manifest, Sprockets::Manifest.new(settings.sprockets, './public/assets')
    end

    get '/' do
      slim :index
    end

    get '*' do
      redirect to('/')
    end

    helpers do
      def asset_path file
        "/assets/#{Site::Application.settings.manifest.assets[file]}"
      end
    end

    use Rack::Deflater
  end
end
