# frozen_string_literal: true

class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :email, uniqueness: { case_sensitive: false }, email_format: { message: 'has invalid format' }
  validates :name, :email, presence: true
  validates :role, presence: true, inclusion: { in: ROLES }
end
