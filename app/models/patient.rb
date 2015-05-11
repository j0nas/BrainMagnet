class Patient < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :entries
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |patient|
      patient.email = auth.info.email
      patient.password = Devise.friendly_token[0, 20]
      # patient.name = auth.info.name # assuming the patient model has a name
      # patient.image = auth.info.image # assuming the patient model has an image
    end
  end

  def self.new_with_session(params, session)
    super.tap do |patient|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        patient.email = data["email"] if patient.email.blank?
      end
    end
  end
end
