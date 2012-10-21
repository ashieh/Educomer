class User < ActiveRecord::Base
  #definition of roles
  #registered = regular user
  #banned = banned user
  #score = can modify scores of food
  #information = can modify nutrition and ingredient of food + score
  #allinfo = can modify all fields of food
  #admin = administrator
  rolify
  after_create :set_default_role

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body



  before_save { |user| user.email = email.downcase }

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /.+@.+\..+/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  private
  def set_default_role
    self.add_role :registered
  end
end
