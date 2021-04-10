
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #redirect
  get "/" do
    redirect to "/articles"
  end
  #index
  get "/articles" do
    @articles = Article.all
    erb :index
  end

  #new
  get "/articles/new" do
    @article = Article.new
    erb :new
  end

  #create
  post "/articles" do
  
    @articles = Article.create(params)
    redirect to "/articles/#{@articles.id}"
  end

  #show
  get "/articles/:id" do
    @article = Article.find(params[:id])
    erb :show
  end

  #edit
  get "/articles/:id/edit" do
    @article = Article.find(params[:id])
    
    erb :edit
  end

   # update
   patch "/articles/:id" do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect to "/articles/#{ @article.id }"
  end

  #destroy
  delete "/articles/:id" do
    Article.destroy(params[:id])
    redirect to "/articles"
  end



end
