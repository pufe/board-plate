class Lobby < ApplicationRecord
  validates :name, presence: true, length: {minimum: 2, maximum: 64}
  validates :status, inclusion: { in: %w(open playing finished) }


  # lobby status diagram
  # open -> playing -> finished

  scope :available, -> { where.not(status: :finished) }
  scope :open, -> { where(status: :open) }
  scope :with_player, ->(player) { where("lobbies.players @> ARRAY[?]::character varying[]", player) }
  scope :with_guest, ->(player) { where("lobbies.guests @> ARRAY[?]::character varying[]", player) }

  attr_accessor :password

  def encrypt_password
    self.encrypted_password = password_hash if password.present?
  end

  def password_hash
    Digest::SHA256.hexdigest("Lobby #{id} has #{password}")
  end

  def authenticate(user)
    if players.include?(user) || guests.include?(user)
      true
    else
      encrypt_password
      Lobby.where(id: id, encrypted_password: encrypted_password).any?
    end
  end
end
