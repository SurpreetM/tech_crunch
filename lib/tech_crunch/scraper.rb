require 'pry'

class TechCrunch::Scraper

  def home_page(url)
    doc = Nokogiri::HTML(open(url))
    
    container = doc.search(".river div").css(".post-block")
    
    
    article_title = container.css(".post-block__title a").text.strip
    
    article_author = container.css(".river-byline__authors a").text.strip
    
    article_publish_time = container.css(".river-byline time").attribute("datetime").value
        
    binding.pry
    
   
    
  end
    
  


   
    
 
    
    # the first article seems to be index 2 in the array.
    # article_title = container.css(".post-block__title a")[2].text.strip
    # author = container.css(".river-byline__authors a")[2].text.strip
    # Will need to convert this into the number of hours since this value. 
    # time_published = container.css(".river-byline time")[2].attribute("datetime").value
    
   


#end of class   
end 