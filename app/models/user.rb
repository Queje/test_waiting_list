class User < ApplicationRecord
  enum waiting_status: { not_confirmed: 0, confirmed: 1, reconfirmation_needed: 2 }

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "is not a valid email" }
  validates :phone, uniqueness: {case_sensitive: false, message: "is already taken" }, format: { with: /\A(?:(?:\+|00)33[\s.-]{0,3}(?:\(0\)[\s.-]{0,3})?|0)[1-9](?:(?:[\s.-]?\d{2}){4}|\d{2}(?:[\s.-]?\d{3}){2})\z/, message: "is not a valid french number" }
  validates :token, presence: true, uniqueness: true

  after_create :send_registration_confirmation

  before_validation :generate_token, on: :create

  private

  def generate_token
    begin
      self.token = SecureRandom.urlsafe_base64(64, false)
    end while self.class.find_by(token: token)
  end
  
  def to_param
    token
  end

  def send_registration_confirmation
    UserMailer.registration_confirmation(self).deliver_now
  end

end
 