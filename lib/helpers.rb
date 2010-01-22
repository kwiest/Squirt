helpers do

  def partial(template, *args)
	options = args.extract_options!
	options.merge!(:layout => false, :views => './views/partials')
	if collection = options.delete(:collection)
	  collection.inject([]) do |buffer, member|
		buffer << erb(template, options.merge(:layout => false, :locals => {template.to_sym => member}))
	  end.join("\n")
	else
	  erb template, options
	end
  end

  def button_to(page, text, *args)
	options = args.extract_options!
	method = options[:method] ? options.delete(:method) : "get"
	options.merge!(:locals => {:page => page, :text => text, :method => method})
	partial :button_to, options
  end

  def admin?
	request.cookies[Blog.admin_cookie_key] == Blog.admin_cookie_value
  end

  def authorize
	stop [401, "Not Authorized"] unless admin?
  end

end
