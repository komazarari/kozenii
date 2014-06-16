class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable
  validates :username, uniqueness: true

  def admin?
    role && role =~ /admin/
  end
end
