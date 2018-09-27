require 'pry'
class TechCrunch::Cli

  HOMEPAGE = "https://techcrunch.com/"

  def run
    # Main cli that is called from the bin file.
    make_articles
    add_article_content
    list_articles
    user_input
  end

  def make_articles
    # Step 1: Scrape the homepage for article title, author and time published
    articles_array = TechCrunch::Scraper.scrape_homepage(HOMEPAGE)
    # Step 2: Deletes any pre-existing article objects and creates article objects from the latest articles array scraped
    TechCrunch::Article.clear
    TechCrunch::Article.create_articles_from_homepage_scrape(articles_array)
  end

  def add_article_content
    url = HOMEPAGE + "#{TechCrunch::Article.all[0].time_published.gsub("-", "/")}/" + "#{TechCrunch::Article.all[0].title.to_s.gsub(/[^-^[:alnum:]^[" "]^["."]]/,"").gsub(" ", "-").gsub(".","-").downcase}/"
    # Adds the article body to the content attribute of article object created from make_articles.
    TechCrunch::Article.all.each do |article|
      article_url = HOMEPAGE + "#{article.time_published.gsub("-", "/")}/" + "#{article.title.to_s.gsub(/[^-^[:alnum:]^[" "]^["."]]/,"").gsub(" ", "-").gsub(".","-").gsub("--","-").downcase}/"
      begin
        article_content = TechCrunch::Scraper.scrape_article_content(article_url)
      rescue
        article.content = "I'm sorry we're having trouble dispaying this article".colorize(:red)
      else
        article.add_article_content(article_content)
      end
    end
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
