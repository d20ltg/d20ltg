class OrderItem < ActiveRecord::Base
  belongs_to :card
  belongs_to :order
end
