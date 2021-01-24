require 'nokogiri'
require 'open-uri'

class Scraper
  def scraper_etsy(key_word)
    # filepath = "results.html" ( just for)
    url = "https://www.etsy.com/search?q=#{key_word}"
    # 1. We get the HTML page content
    # html_content = File.open(filepath)
    html_content = open(url).read
    # 2. We build a Nokogiri document from this file
    doc = Nokogiri::HTML(html_content)
    # 3. We search for the correct elements containing the items' title in our HTML doc
    # DONT PUTS IN THE SCRAPER, only the interface should puts
    # Define a method that take a keyword as a parameter
    # we want to have this return a hash that looks like the gift_list
    # etsy_list = {
    #   'item from etsy' => false
    # }
    etsy_list = []
    doc.search('.v2-listing-card .v2-listing-card__info .text-body').first(5).each do |element|
      # 4. For each item found, we extract its title and print it
      etsy_list << element.text.strip.split[0..6].join(' ')
      # etsy_list[item] = false
      #   puts "Item:"
      #   puts element.text.strip
      #   puts ""
    end
    etsy_list
  end
end
