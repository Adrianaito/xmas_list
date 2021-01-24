class View
  def ask_for_item
    puts 'Add an item to your list'
    gets.chomp
  end

  def display(list)
    list.each_with_index do |item, ind|
      puts "#{ind + 1} - #{item.item}"
    end
  end

  def etsy
    puts 'What are you looking for on etsy?'
    etsy_item = gets.chomp
  end

  def display_etsy(etsy_list)
    etsy_list.each_with_index { |item, ind| puts "#{ind + 1} - #{item}" }
  end

  def choose_etsy_item
    puts 'Choose an item'
    gets.chomp.to_i - 1
  end

  def ask_for_index
    puts 'Which item would you like to remove?'
    gets.chomp.to_i - 1
  end
end
