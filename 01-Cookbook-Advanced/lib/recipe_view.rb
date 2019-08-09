class RecipeView
  def display_recipes(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1} - #{recipe.name} : #{recipe.description} - #{recipe.prep_time}"
    end
  end

  def ask_user_for_name
    puts "Have you a new recipe name ? >"
    return gets.chomp
  end

  def ask_user_for_description
    puts "Have you a new recipe's description to add ? >"
    return gets.chomp
  end

  def ask_user_for_prep_time
    puts "What time you need to cook it ? >"
    return gets.chomp
  end

  def ask_for_recipe_index
    puts "What's the recipe you want to delete ?"
    gets.chomp.to_i - 1
  end

  def ask_for_recipe_keyword(ingredient)
    puts "Give a keyword to search a recipe ?"
    return gets.chomp
  end

  def display_imported_recipes(imported_recipes_list)
    imported_recipes_list.each_with_index do |import_recipe, index|
      puts "#{index + 1} - #{import_recipe.name} - #{import_recipe.prep_time}"
    end
  end

  def ask_for_recipe_index_to_import
    puts "What's the recipe you want to import ?"
    gets.chomp.to_i - 1
  end
end
