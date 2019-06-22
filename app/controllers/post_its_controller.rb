class PostItsController < ApplicationController

  # GET: /post_its
  get "/post_its" do
    not_logged_in?
    @post_its = PostIt.all
    erb :"/post_its/index.html"
  end

  # GET: /post_its/new
  get "/post_its/new" do
    not_logged_in?
    erb :"/post_its/new.html"
  end

  # POST: /post_its
  post "/post_its" do
    not_logged_in?
    if params[:content] != ""
      @post_it = PostIt.create(:content => params[:content], :user_id => current_user.id)
      redirect "/post_its"
    else
      redirect '/post_its/new'
    end

  end

  # GET: /post_its/5
  get "/post_its/:id" do
    not_logged_in?
    @post_it = PostIt.find(params[:id])

    erb :"/post_its/show.html"
  end

  # GET: /post_its/5/edit
  get "/post_its/:id/edit" do
    not_logged_in?
    @post_it = PostIt.find(params[:id])
    erb :"/post_its/edit.html"
  end

  # PATCH: /post_its/5
  patch "/post_its/:id" do
    not_logged_in?
    @post_it = PostIt.find(params[:id])
    @post_it.update(:content => params[:content])


    redirect "/post_its/#{@post_it.id}"
  end

  # DELETE: /post_its/5/delete
  delete "/post_its/:id/delete" do
    not_logged_in?
    @post_it = PostIt.find(params[:id])
    @post_it.delete
    redirect "/post_its"
  end


end
