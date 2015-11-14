class Card < ActiveRecord::Base

  has_many :printings
  belongs_to :expansions

  validates :name, presence: true
  validates :stock, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :card_asc, -> { order("name ASC") }

  def expansion

  end

  after_initialize :init

  def init
    self.stock ||= 0
  end
end
