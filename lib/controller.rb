require_relative 'view'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    display_all
  end

  def create
    #1. ask user for a name and a description
    input_info = @view.ask_name_and_description
    new_recipe = Recipe.new(input_info[0], input_info[1])
    @cookbook << new_recipe
  end

  def destroy
    #1. display all recipes
    display_all
    #2. ask user which wants to delete
    index = @view.ask_user_for_index
    #3. remove recipe from cookbook
    @cookbook.remove_recipe(index)
  end


  private

  def display_all
    #1. get all the recipes
    recipes = @cookbook.all
    #2. display it to the user
    @view.display(recipes)
  end
end
