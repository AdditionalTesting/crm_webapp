require 'sinatra'
require_relative 'contact.rb'

get '/' do
  redirect to '/contacts'
end

get '/contacts' do
  @list_of_contacts = Contact.all
  erb :contacts
end

get '/about' do
  erb :about
end



after do
  ActiveRecord::Base.connection.close
end
