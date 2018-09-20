class TechCrunch::Cli 
  
  #this is the main cli that is called from the bin file. 
  def call
    list_articles
    user_input
  end 
  
  
  def list_articles
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
        
      else
        puts "I'm sorry that is not a valid input"
      end 
    end 
  end 
  
#end of class
end 