# helpers do
#   def current_user
#     if session[:user_id]
#       User.find(session[:user_id])
#     else
#       nil
#     end
#   end
# end

# Homepage (Root path)
get '/' do
  user_id = session[:user_id]

  if !user_id
    redirect 'user/signin'
  else
    erb :index
  end
end

get '/songs' do
	@songs = Song.all
  erb :'songs/index'
end

get '/songs/new' do
	@song = Song.new
	erb :'songs/new'
end

get '/songs/:id' do
  @song = Song.find params[:id]
  erb :'songs/show'
end

post '/songs' do
  @song = Song.new(
    name: params[:name],
    artist: params[:artist],
    url:  params[:url]
  )
  if @song.save
  	redirect '/songs'
  else
  	erb :'songs/new'
  end
end

get '/user/signup' do
  @user = User.new
  erb :'/user/signup'
end

post '/user/signup' do
  @user = User.new
  @user.email = params[:email]
  @user.password = params[:password]
  @user.password_confirmation = params[:password_confirmation]

  if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    erb :'user/signup'
  end
end

get '/user/signout' do
  session[:user_id] = nil
  redirect '/user/signin'
end

get '/user/signin' do
  erb :'user/signin'
end

post '/user/signin' do
  email = params[:email]
  password = params[:password]
  user = User.find_by(email: email)
  if user
    if user.password == password
      session[:user_id] = user.id
      redirect '/'
    else
      redirect 'user/signin'
    end
  else
    redirect 'user/signin'
  end
end
