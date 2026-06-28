require 'sinatra'
require 'json'
require_relative 'lib/store'

get '/api/grades' do
  content_type :json
  Store.all.to_json
end

post '/api/grades' do
  body = JSON.parse(request.body.read)
  halt 400 unless body['name']
  Store.add(body).to_json
end
