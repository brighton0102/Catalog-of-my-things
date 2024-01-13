# # Source class represents a source in the catalog.

class Source
  attr_accessor :name, :items
  attr_reader :id

  def initialize(name)
    @id = rand(1..1000)
    @name = name
    @items = []
  end

  def add_items(item)
    @items << item
    item.source = self
  end
end
