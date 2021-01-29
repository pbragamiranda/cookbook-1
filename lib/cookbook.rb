require 'csv'
class Cookbook
  def initialize(csv_file)
    @recipes = []
    @csv_file = csv_file
    load_csv
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    save_csv
  end

  def remove_recipe(index)
    @recipes.delete_at(index)
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file) do |row|
      @recipes << Recipe.new(row[0], row[1])
    end
  end

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv|
      # csv << ['Name', 'Appearance', 'Origin']
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end
end
