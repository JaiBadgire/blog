class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable,
    :validatable, :registerable, :confirmable 
    # to use devise_confirmable module, registerable and confirmable module must be there
end
