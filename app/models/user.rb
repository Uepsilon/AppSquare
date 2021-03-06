class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :password, :password_confirmation, :remember_me, :channel, :filename
  # attr_accessible :title, :body
end
