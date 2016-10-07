class Contact < ApplicationRecord
  validates :name, presence: true
  validates :message, presence: true
  validates :email, presence: true,
                  format: /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
end
