class User < ApplicationRecord
       before_create :confirmation_token
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: JwtDenylist
  enum role: [:employee, :admin]
  has_many :demandes

  private
  def confirmation_token
        if self.confirm_token.blank?
            self.confirm_token = SecureRandom.urlsafe_base64.to_s
        end
  end

  def email_activate
       self.email_confirmed = true
       self.confirm_token = nil
       save!(:validate => false)
     end


end