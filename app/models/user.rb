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

  private
  def set_default_role
    self.add_role :registered
  end
end
