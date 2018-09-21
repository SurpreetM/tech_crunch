require 'pry'

class TechCrunch::Scraper

  def home_page(url)
    doc = Nokogiri::HTML(open(url))
    binding.pry
  end 


#end of class   
end 