require 'sinatra'
require_relative 'contact.rb'

get '/' do
  erb :index
end

get '/contacts' do
  @list_of_contacts = Contact.all
  erb :contacts
end








after do
  ActiveRecord::Base.connection.close
end
