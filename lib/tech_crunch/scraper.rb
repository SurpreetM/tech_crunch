require 'pry'

class TechCrunch::Scraper

  def items_to_scrape(url)
    # This method will need to be deleted - only used for checking the html tags to scrape.
    doc = Nokogiri::HTML(open(url))
    container = doc.search(".river div").css(".post-block")
    article_title = container.css(".post-block__title a").text.strip
    article_author = container.css(".river-byline__authors a").text.strip
    article_publish_time = container.css(".river-byline time").attribute("datetime").value
  end

  def self.scrape_homepage(url)
    # This method scrapes the homepage and produces and array of articles in the format
    # [ {title1, time_published1, author1}, {title2, time_published2, author2} ]

    doc = Nokogiri::HTML(open(url))
    container = doc.search(".river div").css(".post-block")
    articles_array = []

    container.each do |article|
      article_title = article.css(".post-block__title a").text.strip
      article_author = article.css(".river-byline__authors a").text.strip
      article_publish_time = article.css(".river-byline time").attribute("datetime").value
      articles_array << {title: article_title, time_published: article_publish_time, author: article_author}
    end

    articles_array
  end

  def self.scrape_article_content(url)
    # Placeholder to scrape the main article and add this to the associated article hash within the articles_array.
    doc = Nokogiri::HTML(open(url))
    article_content = ""
    container = doc.search(".article-content").css(".p1")

     container.each do |paragraph|
       # the line space to the end quote separates the paragraphs with a line break.
       article_content << "#{paragraph.css(".s1").text}

"
     end
    article_content
    binding.pry
  end

#end of class
end
