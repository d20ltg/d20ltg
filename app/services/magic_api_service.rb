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

  def self.get_card_by_id(id)
    get_cards(Hash['m', id])
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
    params.empty? ? '' : '?' + params.collect { |k, v| "#{k}=#{v}" } .join('&')
  end

end
