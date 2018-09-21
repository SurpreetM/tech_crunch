require 'pry'

class TechCrunch::Scraper

  def home_page(url)
    doc = Nokogiri::HTML(open(url))
    container = doc.search(".river").children
    
    # iterating through each article in the container to create an array of articles. Each article needs to be a hash with the above key values 
    
    #start by creating an empty array to push the articles into
    articles = []
    
    container.each do |article|
      article_title = container.css(".post-block__title a").text.strip
      author = container.css(".river-byline__authors a").text.strip
      time_published = container.css(".river-byline time").attribute("datetime").value
      articles << {title: article_title, time_published: time_published, author: author}
      binding.pry
    end
    
    #return the articles Array
    articles
    
  end
    
    # the first article seems to be index 2 in the array.
    # article_title = container.css(".post-block__title a")[2].text.strip
    # author = container.css(".river-byline__authors a")[2].text.strip
    # Will need to convert this into the number of hours since this value. 
    # time_published = container.css(".river-byline time")[2].attribute("datetime").value
    
   


#end of class   
end 