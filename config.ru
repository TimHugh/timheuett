require './app'
Dir['./config/*.rb'].each { |file| require file }

map '/assets' do
  run Assets.environment Sinatra::Application.settings.root
end

run Site::Application
