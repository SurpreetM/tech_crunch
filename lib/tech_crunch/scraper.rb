require 'pry'

class TechCrunch::Scraper

  def home_page(url)
    doc = Nokogiri::HTML(open(url))
    
    container = doc.search(".river div").css(".post-block")
    
    
    article_title = container.css(".post-block__title a").text.strip
    
    article_author = container.css(".river-byline__authors a").text.strip
    
    article_publish_time = container.css(".river-byline time").attribute("datetime").value
        
    
   
  end
  
  def self.scrape_home_page(url)
    
    doc = Nokogiri::HTML(open(url))
    
    container = doc.search(".river div").css(".post-block")
    
    articles_array = []
    
    container.each do |article|
      article_title = article.css(".post-block__title a").text.strip
      article_author = article.css(".river-byline__authors a").text.strip
      article_publish_time = article.css(".river-byline time").attribute("datetime").value
      articles_array << {:title = article_title, :time_published = article_publish_time, :author = article_author}
    end 
    
    articles_array
    
    binding.pry
    
  end 

#end of class   
end 