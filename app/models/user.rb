class User < ActiveRecord::Base
  acts_as_voter
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  serialize :roles, Array

  def admin?
    is?(:admin)
  end

  def is?(role)
    roles.include?(role.to_s.humanize.downcase)
  end
end
