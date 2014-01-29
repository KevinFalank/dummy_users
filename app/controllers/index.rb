enable :sessions

get '/' do
  # Look in app/views/index.erb
  erb :signin
end

get '/signup' do
  erb :signup
end

post '/signup' do

  #create user
  User.create(name: params[:name], password: params[:password], email: params[:email])
  session[:valid_user] = true
  redirect "/secret"
end



post '/signin' do
  # Look in app/views/index.erb

  if valid_user = User.authenticate(params[:email], params[:password])
    session[:valid_user] = valid_user
    puts "valid User" + session[:valid_user].to_s
    redirect "/secret"
  else
    session[:valid_user] = false
    puts "valid User" + session[:valid_user].to_s
    redirect "/"
  end
end

get '/secret' do
  # Look in app/views/index.erb
  if session[:valid_user] == true
    erb :secret
  else
    redirect "/"
  end
end

get '/logout' do
  # Look in app/views/index.erb
  session[:valid_user] = false
  erb :signin
end
