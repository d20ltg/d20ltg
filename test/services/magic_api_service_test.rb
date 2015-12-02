require 'test_helper'

class MagicApiServiceTest < ActiveSupport::TestCase

  test 'it can get card list in json format' do
    result = MagicApiService.get_cards
    assert_equal 100, result.size
  end

  test 'it can get single card by id' do
    result = MagicApiService.get_card('archwing-dragon')
    assert_equal 'Archwing Dragon', result['name']
  end

  test 'it can get single card by multiverse id' do
    result = MagicApiService.get_card_by_id('278063')
    assert_equal 'Archwing Dragon', result.first['name']
  end

  test 'it can get set list' do
    result = MagicApiService.get_sets
    assert result.size > 1
  end

  test 'it can get single set by id' do
    result = MagicApiService.get_set('p15A')
    assert_equal '15th Anniversary', result['name']
  end

  test 'invalid id results in an empty array' do
    result = MagicApiService.get_card_by_id('999999')
    assert_equal [], result
  end

end
