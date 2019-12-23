class ChoreController < ApplicationController
    
    get '/chores' do
        authenticate
        @chores = current_user.chores
        erb :'chores/index'
    end

    get '/chores/new' do
        authenticate
        erb :'chores/new'
    end

    post '/chores' do
        u = current_user
        chore = u.chores.build(name: params[:name], description: params[:description])
 
        if chore.save
            redirect '/chores' 
        else
            @message = "You made an mistake! Add a new chore!"
            erb :'chores/new'
        end
    end

    get '/chores/:id' do
        authenticate
        @chore = Chore.find(params[:id])
        if current_user == @chore.user
            erb :'/chores/show'
        else
            redirect to '/login'
        end
    end

    get '/chores/:id/edit' do
        @chore = Chore.find_by(id: params[:id])
        authenticate_user(@chore)
            if @chore.user == current_user
                erb :'/chores/edit'
            else
                erb :error, layout: false
            end
    end

    patch '/chores/:id' do
      @chore = Chore.find_by(id: params[:id])
      authenticate_user(@chore)
      @chore.update(name: params[:name], description: params[:description])
      redirect '/chores'
   end

    delete '/chores/:id' do
        authenticate
        @chore = Chore.find_by(id: params[:id])
            if @chore.user == current_user
                @chore.destroy
                redirect '/chores'
            end
   end

end