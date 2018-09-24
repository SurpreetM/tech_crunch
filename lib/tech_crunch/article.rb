require 'pry'
class TechCrunch::Article

  attr_accessor :title, :time_published, :author

  @@all = []

  def self.run
    articles_array = TechCrunch::Scraper.scrape_homepage("https://techcrunch.com/")
    create_articles_from_homepage_scrape(articles_array)
    binding.pry

  end

  def self.create_articles_from_homepage_scrape(articles_array)
    articles_array.each do |article_hash|
      self.new(article_hash)
    end
  end

  def initialize(article_hash)
    article_hash.each do |attribute, value|
      self.send("#{attribute}=", value)
    end
    @@all << self
  end

  def self.all
    @@all
  end

#end of class
end
