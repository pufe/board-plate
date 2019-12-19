class Login < ApplicationRecord
  attr_accessor :password

  validate :password_uniqueness
  validates :name, presence: true, length: {minimum: 2, maximum: 32}

  before_save :encrypt_password

  def encrypt_password
    self.encrypted_password = password_hash if password.present?
  end

  def password_hash
    Digest::SHA256.hexdigest("User #{name} has #{password}")
  end

  def password_uniqueness
    if Login.where(created_at: 1.week.ago..1.week.from_now,
                   name: name)
         .where.not(encrypted_password: password_hash)
         .any?
      errors.add(:password, "A different password was used.")
    end
  end
end
