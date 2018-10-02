class TechCrunch::Cli

  HOMEPAGE = "https://techcrunch.com/"

  def call
    make_articles
    run
  end


  def run
    # add_article_content
    list_articles
    user_input
  end

  def make_articles
    # Step 1: Scrape the homepage for article title, author and time published
    articles_array = TechCrunch::Scraper.scrape_homepage(HOMEPAGE)
    # Creates article objects from the latest articles array scraped
    TechCrunch::Article.create_articles_from_homepage_scrape(articles_array)
  end

  def list_articles
    # Runs through articles.all and displays the title, author and time published for each article object.
    puts "Welcome! Here are the latest TechCrunch articles:".colorize(:blue)
    puts "----------------------------------------------------------------------".colorize(:green)
    TechCrunch::Article.all.each.with_index(1) do |article, index|
      puts "#{index}. #{article.title}. By #{article.author} (#{article.time_published})"
    end
  end


  def user_input
    input = nil
    puts "----------------------------------------------------------------------".colorize(:green)
    puts "Please enter the number of the article (1 - 20) that you would like to read, otherwise type EXIT to leave or LIST to view latest article list".colorize(:blue)
    input = gets.strip.downcase
      if input.to_i > 0 && input.to_i < 21
        TechCrunch::Scraper.scrape_article_content(TechCrunch::Article.all[input.to_i - 1]) if TechCrunch::Article.all[input.to_i - 1].content.nil?
        # This is a valid article reference.
        # Displays the article title followed by the content.
        puts TechCrunch::Article.all[input.to_i - 1].title.upcase
        puts TechCrunch::Article.all[input.to_i - 1].content
        user_input
      elsif input == "exit"
        puts "Goodbye & have a nice day :)".colorize(:blue)
      elsif input == "list"
        run
      else
        # This is an invalid input.
        puts "I'm sorry that is not a valid response".colorize(:blue)
        user_input
      end
  end


#end of class
end
