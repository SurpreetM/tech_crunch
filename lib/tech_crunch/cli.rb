require 'pry'
class TechCrunch::Cli

  HOMEPAGE = "https://techcrunch.com/"

  def testing_url
    make_articles
    #not currently working as it's not removing the apostrophes.
    url = HOMEPAGE + "#{TechCrunch::Article.all[0].time_published.gsub("-", "/")}/" + TechCrunch::Article.all[0].title.to_s.gsub(/[^[:alnum:]^[" "]]/,"").gsub(" ", "-").downcase
    puts url
  end


  #this is the main cli that is called from the bin file.
  def run
    make_articles
    add_article_content
    list_articles
    user_input
  end

  def make_articles
    # step 1: Scrape the homepage for article title, author and time published
    articles_array = TechCrunch::Scraper.scrape_homepage(HOMEPAGE)
    # step 2: Deletes any pre-existing article objects and creates article objects from the latest articles array scraped
    TechCrunch::Article.clear
    TechCrunch::Article.create_articles_from_homepage_scrape(articles_array)
  end

  def add_article_content
    #This method should add the article body to the article object already created from the method make_articles.
    TechCrunch::Article.all.each do |article|
      article_content = TechCrunch::Scraper.scrape_article_content("https://techcrunch.com/2018/09/27/rally-rd-the-app-that-lets-you-invest-in-classic-cars-raises-7m-series-a/")
      article.add_article_content(article_content)
    end
  end


  def list_articles
    # This runs through articles.all and displays the title, author and time published for each article object.
    puts "Here are today's articles:"

    TechCrunch::Article.all.each.with_index(1) do |article, index|
      puts "#{index}. #{article.title}, by #{article.author} (#{article.time_published})
      "
    end
  end



  def user_input

    input = nil

    puts "Please enter the number of the article (1 - 20) that you would like to read, otherwise type EXIT to leave or LIST to view latest articles"

    input = gets.strip.downcase

      if input.to_i > 0 && input.to_i < 21
        puts TechCrunch::Article.all[input.to_i - 1].content
        user_input

      elsif input == "exit"
        puts "Goodbye and have a nice day :)"

      elsif input == "list"
        run

      else
        puts "I'm sorry that is not a valid response"
        user_input
      end

  end


#end of class
end
