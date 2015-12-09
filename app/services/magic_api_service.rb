require 'net/http'
require 'json'

# See the DeckBrew API documentation at
# https://deckbrew.com/api/

class MagicApiService

  @@base_uri = 'https://api.deckbrew.com/mtg/'

  def self.get_cards(params = {})
    get_json 'cards', params
  end

  def self.get_card(id)
    get_json 'cards/' + id
  end

  def self.get_card_by_name_and_set(name, set)
    get_cards(Hash['name', name, 'set', set])
  end

  def self.get_card_by_id(id)
    get_cards(Hash['m', id])
  end

  def self.create_card_from_hash(expansion, params)
    edition = params['editions'].detect do |edition|
      edition['set_id'] == expansion.set_abbreviation
    end

    image_url = edition ? edition['image_url'] : ''

    Card.create(
      expansion_id: expansion.id,
      name: params['name'],
      color: params['colors'].collect {|color| color.capitalize }.join(', '),
      card_type: params['types'].collect {|type| type.capitalize }.join(', '),
      image_url: image_url
    )
  end

  def self.get_image_url_for_card(card)
    expansion = Expansion.find(card.expansion_id)
    set = expansion.set_abbreviation
    card_data = get_cards({ :set => set, :name => card.name }).first
    if card_data
      edition = card_data['editions'].detect {|edition| edition['set_id'] == set }
      return edition ? edition['image_url'] : ''
    else
      return ''
    end
  end

  def self.get_sets(params = {})
    get_json 'sets', params
  end

  def self.get_set(id)
    get_json 'sets/' + id
  end

  def self.get_typeahead(text)
    get_json 'cards/typeahead?q=' + text
  end

  private

  def self.get_json(name, params = {})
    begin
      query = get_query_string(params)
      uri = URI(@@base_uri + name + query)
      Rails.logger.info "get_json #{uri}"
      response = Net::HTTP.get uri
      JSON.parse response
    rescue
      false
    end
  end

  def self.get_query_string(params)
    params.empty? ? '' : '?' + params.collect { |k, v| "#{k}=#{v}" } .join('&').gsub(/ /, '%20')
  end

end
