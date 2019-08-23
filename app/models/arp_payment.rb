class ArpPayment < ApplicationRecord
  belongs_to :arp_expense
  has_one_attached :paymentDocument

  validates :inKindValue, :numericality => { :greater_than_or_equal_to => 0 }, presence: true
  validates :inCashValue, :numericality => { :greater_than_or_equal_to => 0 }, presence: true
  validates :date, presence: true
  validates :bizagiCode, presence: true
end
