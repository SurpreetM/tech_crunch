require 'pry'
class TechCrunch::Cli

  #this is the main cli that is called from the bin file.
  def run
    # step 1: Scrape the homepage for article title, author and time published
    articles_array = TechCrunch::Scraper.scrape_homepage("https://techcrunch.com/")

    # step 2: Create article objects from the array scraped
    TechCrunch::Article.clear
    TechCrunch::Article.create_articles_from_homepage_scrape(articles_array)

    # step 3: Add in the article content to the article object
    #add_article_body

    # step 4: List the articles users can select from
    list_articles

    # step 5: Ask for user input into what they would like to do (select article to read or exit)
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

    TechCrunch::Article.all.each.with_index(1) do |article, index|
      puts "#{index}. #{article.title}, by #{article.author} (#{article.time_published})
      "
    end
  end



  def user_input
    input = nil

    while input != "exit"
    puts "Please enter the number of the article you would like to read otherwise type EXIT to leave or LIST to view latest articles"

    input = gets.strip.downcase

      if input == "1"
        puts "This is article 1 XXX"

      elsif input == "2"
        puts "This is article 2 XXX"

      # This isn't quite working correctly. When user types in list, it re-runs the programme.
      # If user then types in exit, the input variable is still saves as list
      elsif input == "list"
        run

      elsif input == "exit"
        binding.pry
        puts "Goodbye and have a nice day :)"

      else
        puts "I'm sorry that is not a valid response"
      end

    end
  end


#end of class
end
