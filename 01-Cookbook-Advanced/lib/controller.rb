require_relative 'cookbook'
require_relative 'recipe_view'
require_relative 'parsing'
require "pry-byebug"

require 'nokogiri'
require 'open-uri'


class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = RecipeView.new
  end

  def list
    # all the recipes
    # ask repo for task list
    recipes = @cookbook.all
    # send list to task view
    @view.display_recipes(recipes)
  end

  def create
    # a new recipe
    name = @view.ask_user_for_name
    # ask user for task description
    description = @view.ask_user_for_description
    prep_time = @view.ask_user_for_prep_time
    # creer la tache
    recipe = Recipe.new(name, description, prep_time)
    # add task to repo
    @cookbook.add_recipe(recipe)
    # affichier la liste des taches
    list
  end

  def destroy
    # an existing recipe
    recipe_index = @view.ask_for_recipe_index
    @cookbook.remove_recipe(recipe_index)
  end

  def import
    # Ask user for ingredient
    ingredient = @view.ask_for_recipe_keyword("ingredient")
    # Scrap recipes for ingredient in store in variable
    service = ScrapService.new(ingredient)
    imported_recipes_list = service.call
    # display list of recipes
    @view.display_imported_recipes(imported_recipes_list)
    # ask user which recipe to add in cookbook
    index = @view.ask_for_recipe_index_to_import
    # add recipe in cookbook
    @cookbook.add_recipe(imported_recipes_list[index])
    # display recipes of cookbook
    list
  end
end

