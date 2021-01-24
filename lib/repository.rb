require 'csv'
require_relative 'scraper'

class Repository
    def initialize(csv_file)
        @list = []
        @etsy_list = Scraper.new
        @csv_file = csv_file
        load_csv
    end

    def all
        @list
    end

    def add_item(item)
        @list << item
        save_csv
    end

    # def add_etsy_item(item)
    #     @list << item
    #     save_etsy
    # end

    def remove_item(index)
        @list.delete_at(index)
        save_csv
    end
    def load_csv
        CSV.foreach(@csv_file) do |row|
            item = List.new(row[0])
            @list << item
        end
    end
  def save_csv
      CSV.open(@csv_file, 'wb', force_quotes: true) do |csv|
          @list.each do |item|
              csv << [item.item]
          end
      end
  end

#   def save_etsy
#     CSV.open(@csv_file, 'ab', force_quotes: true) do |csv|
#         @list.each do |item|
#             csv << [item.item]
#         end
#     end
#   end
end