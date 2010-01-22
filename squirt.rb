require "rubygems"
require "sinatra"
require "mongo_mapper"
require "models/post"

configure do
  MongoMapper.database = "kyle_development"

  require "ostruct"
  Blog = OpenStruct.new(
	:title => "Your squirt blog",
	:author => "John Doe",
	:url_base => "http://localhost:4567/",
	:admin_password => "change_me",
	:admin_cookie_key => "squirt_admin_key",
	:admin_cookie_value => "5g83f0g8s3jg9s01dghd9"
  )
end

load "lib/routes.rb"
load "lib/helpers.rb"
