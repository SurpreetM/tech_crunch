require 'pry'
class TechCrunch::Cli 
  
  #this is the main cli that is called from the bin file. 
  def run
    #make_articles
    #add_article_body
    list_articles
    user_input
  end 
  
  def make_articles
    #this method needs to take an array of articles from the scraper class 
    #articles_array = Scraper.scrape_home_page(url)
    #next it needs to create new Article objects 
  end 
  
  def add_article_body
    #This method should add the article body to the article object already created from the method make_articles. 
    
  end 
  
  
  def list_articles
    # This should run through articles.all and display the necessary attributes for each article object. 
    
    puts "Here are today's articles:"
    
    #Article 1 Title, Author & Time since publication
    puts "1. GitLab raises $100m (by Fredric Lardinoise, 22 hours)"
    
    #Article 2 Title, Author & Time since publication
    puts "2. Einstin Voice gives Salesforce users gift of the gab (by Ron Miller, 23 hours)"
  end 
  
  
  
  def user_input
    input = nil 
    
    while input != "exit"
    puts "Please enter the number of the article you would like to read or type EXIT to leave" 
    input = gets.strip.downcase
    
      if input == "1" 
        puts "This is article 1 XXX"
        
      elsif input == "2" 
        puts "This is article 2 XXX"
        
      elsif input == "exit"
        puts "Goodbye, have a nice day :)"
        
      else 
        puts "I'm sorry that is not a valid response"
      end 
    end 
  end 
  
  
#end of class
end 