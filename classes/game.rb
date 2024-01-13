# # Game class represents a video game item in the catalog.

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :author

  def initialize(id, title, publish_date, multiplayer, last_played_at, author) # rubocop:disable Metrics/ParameterLists
    super(id, title, publish_date)
    @id = Random.rand(1..1000)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @author = author
  end

  def can_be_archived?
    super && (Date.today - @last_played_at.to_date).to_i > 730
  end

  def to_json(*_args)
    {
      'class_name' => 'Game',
      'id' => id,
      'title' => title,
      'publish_date' => publish_date.strftime('%Y-%m-%d'),
      'multiplayer' => multiplayer,
      'last_played_at' => last_played_at,
      'author' => author.to_json
    }
  end

  def self.from_json(data)
    author_data = data['author']
    author = Author.from_json(author_data)
    Game.new(data['id'], data['title'], Date.parse(data['publish_date']), data['multiplayer'], data['last_played_at'],
             author)
  end
end
