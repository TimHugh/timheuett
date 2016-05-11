require './app'
Dir['./config/*.rb'].each { |file| require file }

unless ENV['RACK_ENV'] == 'production'
  map '/assets' do
    run Site::Assets.environment Site::Application.root
  end
end

run Site::Application
