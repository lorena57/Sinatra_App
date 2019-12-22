class ToolsController < ApplicationController

   get '/tools' do
      authenticate
      @tools = Tool.all
      erb :'tools/index'
   end

   get 'tools/new' do
      authenticate
      erb :'tools/new'
   end



end