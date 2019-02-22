class User < ApplicationRecord
  has_secure_password
    validates :name, :role,:email, presence: true
   # validates :email #, uniqueness: true
    # validates :password, presence: true, allow_nil: true #, :if => :password # only validate if password changed!
    # attr_accessor :email , :password , :password_confirmation
  ROLE_LIST = ["Realtor", "HouseHunter"]
  CONTACT_METHOD = ["Phone","Text","Email"]

  def admin?
    self.role == "Admin"
  end

  def realter?
    self.role == "Realtor"
  end

  def hunter?
    self.role == "HouseHunter"
  end
  def find_realtor_by_company(id)
    @user = User.where("company_id == ? and users.role == ?", id, "Realtor")
  end

end
