class UnifiedIndex < Chewy::Index
  settings analysis: {
      analyzer: {
          title: {
              tokenizer: 'standard',
              filter: %w(lowercase asciifolding)
          }
      }
  }

  define_type Album do
    field :title, analyzer: 'title'
    field :artist, value: ->(artist) { artist.name }
    field :aritst_id, type: 'integer'
    field :release_date, type: 'date'
    field :rating, type: 'integer'
    field tracks do
      field :title, analyzer: 'title'
    end
  end

  define_type Track do
    field :title, analyzer: 'title'
    field :artist, value: ->(artist) { artist.name }
    field :aritst_id, type: 'integer'
    field :rating, type: 'integer'
    field :date, type: 'date'
  end

  define_type Artist do
    field :name, type: 'string'
    field :albums do
      field :title, analyzer: 'title'
    end

  end
end