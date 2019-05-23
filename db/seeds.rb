# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'
require 'faker'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

ingredients = open(url).read
result = JSON.parse(ingredients)

drinks = result["drinks"]

drinks.each do |drink|
  ingredient = drink["strIngredient1"]
  Ingredient.create(name: ingredient)
end

10.times do
  Cocktail.create(name: Faker::Coffee.blend_name)
end

10.times do
  Dose.create(
    ingredient: Ingredient.all.sample,
    description: ,
    cocktail: Cocktail.all.sample
    )
end
