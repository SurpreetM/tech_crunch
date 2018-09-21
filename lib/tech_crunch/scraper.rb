require 'pry'

class TechCrunch::Scraper

  def home_page(url)
    doc = Nokogiri::HTML(open(url))
    container = doc.search(".river div")
    articles = container.css(".post-block")
    
    article_title = articles.css(".post-block__title a")[0].text.strip
    
    binding.pry
    
  end
    
     # start by creating an empty array to push the articles into
     # articles = []
    
    # iterate through each article in the container to create an array of articles. Each article needs to be a hash with the above key values 
    
     #container.each do |article|
      # article.each do |element|
       # article_title = container.css(".post-block__title a").text.strip
        #author = container.css(".river-byline__authors a").text.strip
        #time_published = container.css(".river-byline time").attribute("datetime").value
        #articles << {title: article_title, time_published: time_published, author: author}
      #end 
    #end
    #return the articles Array
    
    #articles
  
  


   
    
 
    
    # the first article seems to be index 2 in the array.
    # article_title = container.css(".post-block__title a")[2].text.strip
    # author = container.css(".river-byline__authors a")[2].text.strip
    # Will need to convert this into the number of hours since this value. 
    # time_published = container.css(".river-byline time")[2].attribute("datetime").value
    
   


#end of class   
end 