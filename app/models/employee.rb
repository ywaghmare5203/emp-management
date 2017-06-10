class Employee < ActiveRecord::Base
  attr_accessor :remember_token, :activation_token
  before_save   :downcase_email
  before_create :create_activation_digest
	validates :last_name, 		presence: true
	validates :service_no, 		presence: true, 
								length: { minimum: 5 },
								length: { maximum: 8 },
								format: { with: /\A^\d+$\z/ },
								uniqueness: true
	validates :date_of_birth, 	presence: 
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
	validates :gender, 			presence: true
	validates :service_start_date, presence: true
	validates :substantive_rank, presence: true
	validates :password, length: { minimum: 6 }, allow_blank: true
	has_many :competencies
	has_many :spouses
	has_many :next_of_kins
	has_many :phones
	has_many :qualifications
	has_many :addresses
  has_one :medical_record
  has_many :notes
  has_many :reports
  has_one :trade_career
	has_many :assignments, inverse_of: :employee
  has_many :roles, :through => :assignments
  accepts_nested_attributes_for :assignments
  accepts_nested_attributes_for :roles
		
	has_secure_password

    has_attached_file :avatar,
    :storage => :s3,
  :default_url => 'http://s3.amazonaws.com/leadapp/default_original_profile_pic.png',
  #:styles => {:medium    => '200x350'},
  :path => "user/:id/profile/:style.:extension",
  :bucket => "leadapp",
  :s3_credentials => {
    :access_key_id => "AKIAJUD4SFZKM5Q4W7KQ",
    :secret_access_key => "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"
  }
	
	  # This method associates the attribute ":avatar" with a file attachment
#  has_attached_file :avatar, styles: {
#    thumb: '100x100>',
#    square: '200x200#',
#    medium: '300x300>'
#  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  
   # Returns the hash digest of the given string.
  def Employee.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
	
	  # Returns a random token.
  def Employee.new_token
    SecureRandom.urlsafe_base64
  end
  
  def remember
    self.remember_token = Employee.new_token
    update_attribute(:remember_digest, Employee.digest(remember_token))
  end
  
    # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end
  
    # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end
  
  def activate
    update_attribute(:activated,    true)
    update_attribute(:activated_at, Time.zone.now)
  end
  
  # Sends activation email.
  def send_activation_email
    EmployeeMailer.account_activation(self).deliver_now
  end
  
  # Sends password reset email.
  def send_password_reset_email
    EmployeeMailer.password_reset(self).deliver_now
  end
  
   # Sets the password reset attributes.
  def create_reset_digest
    self.reset_token = Employee.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end
  
  # Returns true if a password reset has expired.
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end
  
  def age
     x = Date.today.year - date_of_birth.year
     x -= 1 if Date.today < date_of_birth + x.years #for days before birthday
  end
  
  def years_of_service
    Date.today.year - service_start_date.year
  end
  
  def has_role?(role_sym)
    roles.any? { |r| r.name.underscore.to_sym == role_sym }
  end
  
  private
  
  
    # Converts email to all lower-case.
    def downcase_email
      self.email = email.downcase
    end
    
    # Creates and assigns the activation token and digest.
    def create_activation_digest
      self.activation_token  = Employee.new_token
      self.activation_digest = Employee.digest(activation_token)
    end
end
