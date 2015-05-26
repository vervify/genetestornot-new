require 'bundler'
Bundler.require
# require 'sinatra'
# require 'sinatra/reloader'

get '/disclaimer' do
  erb :disclaimer
end

get '/landing' do
  erb :landing
end

get '/family_risks' do
  erb :family_risks
end

get '/is_timing_right' do
  erb :is_timing_right
end

get '/pros_vs_cons' do
  erb :pros_vs_cons
end

get '/useful_info' do
  erb :useful_info
end