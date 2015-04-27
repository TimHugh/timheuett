require './app'
Dir['./config/*.rb'].each { |file| require file }

unless ENV['RACK_ENV'] == 'production'
  map '/assets' do
    run Site::Assets.environment Sinatra::Application.settings.root
  end
end

run Site::Application
