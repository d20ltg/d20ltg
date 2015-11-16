require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  def current_user
    users :default
  end
end
