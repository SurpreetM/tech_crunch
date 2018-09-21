require 'pry'

class TechCrunch::Scraper

  def home_page(url)
    Nokogiri::HTML(open(url))
  end 


#end of class   
end 