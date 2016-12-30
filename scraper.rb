require 'HTTParty'
require 'nokogiri'

# url_to_scrape = 'http://damndelicious.net/2016/05/08/chicken-potatoes-garlic-parmesan-cream-sauce/'
# url_to_scrape = 'http://thepioneerwoman.com/cooking/french-dip-sandwiches/'
url_to_scrape = 'http://www.foodnetwork.com/recipes/food-network-kitchens/sausage-gravy-breakfast-lasagna.html'

file = HTTParty.get(url_to_scrape)
html = Nokogiri::HTML(file)

output = File.new('recipe.html', 'w+')

if url_to_scrape.include? "damndelicious.net"

title = html.at_css('.post-title').text
ingredients = html.at_css('.ingredients').text
directions = html.at_css('.instructions').text
notes = html.at_css('.notes').text

output.write(title + "\n")
output.write("Ingerdients: \n" + ingredients + "\n")
output.write("Directions: \n " + directions + "\n")

elsif url_to_scrape.include? "thepioneerwoman.com"
title = html.at_css('.entry-title').text
ingredients= html.at_css('.list-ingredients').text
# directions = html.at_css('').text

output.write(title + "\n")
output.write("Ingerdients: \n" + ingredients + "\n")
# output.write("Directions: \n " + directions + "\n")

elsif url_to_scrape.include? "foodnetwork.com"
  title = html.at_css('.title').text
  ingredients = html.at_css('.ingredients').text
  directions = html.at_css('.directions').text

  output.write(title + "\n")
  output.write("Ingerdients: \n" + ingredients + "\n")
  output.write("Directions: \n " + directions + "\n")

else

  output.write("Sorry this site is not yet supported, but you can manually add it ")

end
