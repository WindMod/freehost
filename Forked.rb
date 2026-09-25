# Forked.rb
require 'sinatra'
require 'json'

VISITS = Hash.new { |h, k| h[k] = [] }

post '/track-visit' do
  data = JSON.parse(request.body.read)
  link_id = data['link_id']
  VISITS [link_id] << data['visited_at']
  status 200
end

get '/visited/:link_id' do
  content_type :json
  { link_id: params[:link_id], visits: VISITS[params[:link_id]] }.to_json
end
