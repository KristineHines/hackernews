get '/' do
  @posts = Post.all
  erb :index
end

get '/login' do
  erb :login
end

post '/login' do
  @posts = Post.all
  @user = User.authenticate(params[:username], params[:password])
  if @user
    erb :index
  else
    @errors = "incorrect username or password"
    erb :login
  end
end

post '/create_account' do
  @posts = Post.all
  @user = User.create(params)

  erb :index
end


