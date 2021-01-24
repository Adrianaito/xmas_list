require_relative 'view'
require_relative 'list'
require_relative 'scraper'

class Controller
    def initialize(repository)
        @repository = repository
        @view = View.new
        @scraper = Scraper.new
    end

    def create
        item = @view.ask_for_item
        new_item = List.new(item)
        @repository.add_item(new_item)
    end
    def etsy
        etsy_item = @view.etsy
        etsy_list = @scraper.scraper_etsy(etsy_item)
        @view.display_etsy(etsy_list)
        item_ind = @view.choose_etsy_item
        new_etsy_item = List.new(etsy_list[item_ind])
        @repository.add_item(new_etsy_item)
    
    end
    def list_all
        list = @repository.all
        @view.display(list)
    end

    def destroy
        list_all
        index = @view.ask_for_index
        @repository.remove_item(index)
    end
end
