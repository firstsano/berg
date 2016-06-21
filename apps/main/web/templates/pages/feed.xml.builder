xml.instruct!
xml.feed "xmlns" => "http://www.w3.org/2005/Atom" do
  xml.title "Icelab"
  xml.id "http://icelab.com.au"
  xml.link "href" => "http://icelab.com.au"
  xml.link "href" => "http://icelab.com.au/feed.xml", "rel" => "self"
  xml.updated(self[:posts].first.updated_at.to_time.iso8601) unless self[:posts].empty?
  xml.author { xml.name "Icelab" }

  self[:posts].each do |post|
    xml.entry do
      xml.title post.title, "type" => "html"
      xml.link "rel" => "alternate", "href" => "http://icelab.com.au/notes/#{post.slug}"
      xml.id "http://icelab.com.au/notes/#{post.slug}"
      xml.published post.published_at.to_time.iso8601
      xml.updated post.updated_at.iso8601
      xml.author { xml.name post.author.name }
      xml.content post.body, "type" => "html"
    end
  end
end
