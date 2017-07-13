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

get '/contacts/:id' do
  @contact = Contact.find_by({id: params[:id].to_i})
  if @contact
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
  #  for how to handle requests to this route will go here
end


after do
  ActiveRecord::Base.connection.close
end
