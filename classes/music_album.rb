# # MusicAlbum class represents a music album item in the catalog.

class MusicAlbum < Item
  attr_reader :on_spotfy

  def initialize(id, title, publish_date, on_spotfy)
    super(id, title, publish_date)
    @on_spotfy = on_spotfy
  end

  def can_be_archived?
    super && @on_spotfy == true
  end

  def to_json(*_args)
    {
      'class_name' => 'MusicAlbum',
      'id' => id,
      'title' => title,
      'publish_date' => publish_date,
      'on_spotfy' => on_spotfy
    }
  end

  def self.from_json(data)
    MusicAlbum.new(data['id'], data['title'], data['publish_date'], data['on_spotify'])
  end
end
