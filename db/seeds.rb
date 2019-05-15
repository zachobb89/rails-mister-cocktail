require 'json'
require 'open-uri'

Ingredient.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
result = JSON.parse(open(url).read)

result['drinks'].each do |ingredient|
  Ingredient.create(name: ingredient['strIngredient1'])
end
