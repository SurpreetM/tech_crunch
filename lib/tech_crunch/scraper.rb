class TechCrunch::Scraper

  def self.scrape_homepage(url)
    # This method scrapes the homepage and produces and array of articles in the format
    # [ {title1, time_published1, author1}, {title2, time_published2, author2} ]
    doc = Nokogiri::HTML(open(url))
    container = doc.search(".river div").css(".post-block")
    articles_array = []

    container.each do |article|
      article_title = article.css(".post-block__title a").text.strip
      article_author = article.css(".river-byline__authors a").text.strip.gsub("\n",", ").gsub("\t","")
      article_publish_time = "#{article.css(".river-byline time").attribute("datetime").value}"[0..9]
      article_url = article.css(".post-block__title a").attribute("href").value
      articles_array << {title: article_title, time_published: article_publish_time, author: article_author, url: article_url}
    end

    articles_array
  end


  def self.scrape_article_content(article)
    doc = Nokogiri::HTML(open(article.url))
    article_content = ""
    container = doc.search(".article-content p")

     container.each do |paragraph|
       # The line space to the end quote separates the paragraphs with a line break.
       article_content << "#{paragraph.text}

"
      end

    article.content = article_content
  end


#end of class
end
