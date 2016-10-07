class Contact < ApplicationRecord
  validates :name, presence: true
  validates :message, presence: true
  validates :email, presence: true,
                  format: /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :address, presence: true
  validates :amount, presence:     true,
                     numericality: { greater_than: 0 }
  geocoded_by :address
  after_validation :geocode
end
