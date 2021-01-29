class View
  def display(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1} - #{recipe.name} - #{recipe.description}"
    end
  end

  def ask_name_and_description
    puts "Whats the name of the recipe?"
    name = gets.chomp
    puts "What about the description?"
    description = gets.chomp
    [name, description]
  end

  def ask_user_for_index
    puts "What index would you like to delete"
    gets.chomp
  end
end
