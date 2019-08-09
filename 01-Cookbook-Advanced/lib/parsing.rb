require 'nokogiri'
require 'open-uri'
require 'pry-byebug'
require_relative 'recipe'

class ScrapService
  def initialize(ingredient)
    @ingredient = ingredient
  end

  def call
    url = "https://www.marmiton.org/recettes/recherche.aspx?type=all&aqt=#{@ingredient}"
    doc = Nokogiri::HTML(open(url), nil, 'utf-8')
    imported_recipes_list = []
    doc.search(".recipe-card").first(5).each do |card|
      name = card.search(".recipe-card__title").text
      description = card.search(".recipe-card__description").text.strip
      prep_time = card.search(".recipe-card__duration__value").text
      imported_recipes_list << Recipe.new(name, description, prep_time)
    end
    imported_recipes_list
  end
end
