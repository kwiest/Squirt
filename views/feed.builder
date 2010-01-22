xml.instruct! :xml, :version => '1.1'

xml.feed "xmlns" => "http://www.w3.org/2005/Atom" do
  xml.title = "Kyle Wiest's Blog"
  xml.id = "http://kylewiest.com/blog"

  @posts.each do |post|
	xml.entry do
	  xml.title post.title
	  xml.id "http://kylewiest.com/posts/#{post.id}"
	  xml.content post.body
	end
  end
end
