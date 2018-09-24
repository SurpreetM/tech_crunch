require 'pry'
class TechCrunch::Article

  attr_accessor :title, :time_published, :author

  @@all = []

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

  def self.clear
    @@all.clear
  end


#end of class
end
