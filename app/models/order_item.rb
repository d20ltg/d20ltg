class OrderItem < ActiveRecord::Base

  belongs_to :card
  belongs_to :order

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :unit_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validate :card_present
  validate :order_present

  before_save :finalize

  def total_price
    unit_price * quantity
  end

private

  def card_present
    if card.nil?
      errors.add(:card, "must be present")
    end
  end

  def order_present
    if order.nil?
      errors.add(:order, "is not a valid order")
    end
  end

  def finalize
    self[:total_price] = quantity * self[:unit_price]
  end

end
