class User < ActiveRecord::Base
  has_many :deals
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  enum role: [:employee, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :employee
  end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
