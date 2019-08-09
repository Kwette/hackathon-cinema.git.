require 'csv'
require_relative 'recipe'

class Cookbook
  attr_accessor :recipes, :csv_file_path

  def initialize(csv_file_path)
    # loads existing Recipe from the CSV
    @csv_file_path = csv_file_path
    @recipes = []
    load_csv
  end

  def load_csv
    CSV.foreach(@csv_file_path) do |row|
      @recipes << Recipe.new(row[0], row[1], row[2])
    end
  end

  def store_csv
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
    CSV.open(@csv_file_path, 'wb', csv_options) do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.prep_time]
      end
    end
  end

  def all
    # return all recipes
    @recipes
  end

  def add_recipe(recipe)
    # which adds a new recipe to the cookbook
    @recipes << recipe
    store_csv
  end

  def remove_recipe(recipe_index)
    # which removes a recipe from the cookbook.
    @recipes.delete_at(recipe_index)
    store_csv
  end
end
