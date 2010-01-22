# App Root
get '/' do
  @posts = Post.all
  erb :index
end

# ATOM Feed
get '/feed' do
  @posts = Post.all
  builder :feed
end

# New Post
get '/posts/new' do
  authorize
  @post = Post.new
  erb :new
end

# Show Post by id
get '/posts/:id' do
  @post = Post.find(params[:id])
  erb :show
end

# Edit Post by id
get '/posts/:id/edit' do
  authorize
  @post = Post.find(params[:id])
  erb :edit
end

# Create the Post and redirect
post '/posts/' do
  authorize
  @post = Post.create(params[:post])
  redirect "/posts/#{@post.id}"
end

# Update the Post by id and redirect
put '/posts/:id' do
  authorize
  Post.update(params[:id], params[:post])
  redirect "/posts/#{params[:id]}"
end

# Delete the Post by id and redirect to root
delete '/posts/:id' do
  authorize
  @post = Post.find(params[:id])
  @post.destroy
  redirect '/'
end

# Login
get '/login' do
  erb :login
end

post '/login' do
  set_cookie(Blog.admin_cookie_key, Blog.admin_cookie_value) if params[:password] == Blog.admin_password
  redirect '/'
end

get '/logout' do
  delete_cookie(Blog.admin_cookie_key)
  redirect '/'
end
