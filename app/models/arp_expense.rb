class ArpExpense < ApplicationRecord
  belongs_to :contribution_rp_item
  validates :totalPayed, :numericality => { :greater_than_or_equal_to => 0 }, presence: true
  validates :remaining, :numericality => { :greater_than_or_equal_to => 0 }, presence: true
  validates :inKindValue, :numericality => { :greater_than_or_equal_to => 0 }, presence: true
  validates :inCashValue, :numericality => { :greater_than_or_equal_to => 0 }, presence: true
  validates :totalPayedInCash, :numericality => { :greater_than_or_equal_to => 0 }, presence: true
  validates :totalPayedInKind, :numericality => { :greater_than_or_equal_to => 0 }, presence: true
  validates :remainingInCash, :numericality => { :greater_than_or_equal_to => 0 }, presence: true
  validates :remainingInCash, :numericality => { :greater_than_or_equal_to => 0 }, presence: true

  #validates :inKindValue, :numericality => { :greater_than_or_equal_to => 0 }, presence: true
end
