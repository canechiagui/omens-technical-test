class Product < ApplicationRecord
  validates :name, :description, presence: true
  validates :price, numericality: { greater_than: 0 }, presence: true
  validates :stock_quantity, numericality:
  { only_integer: true, greater_than: 0}, presence: true
end
