class User < ActiveRecord::Base
  has_secure_password
  before_create :generate_auth_token

  validates :user_name, presence: true, :length => {:minimum => ConfigCenter::GeneralValidations::FIRSTNAME_MIN_LEN,
    :maximum => ConfigCenter::GeneralValidations::USERNAME_MAX_LEN,
    :message =>"First Name must be within 2 to 32"},
    :format => {:with => ConfigCenter::GeneralValidations::USERNAME_FORMAT_REG_EXP,
      :message =>"User Name contains alphabets, numbers and '_'"}

  validates :first_name, presence: true, :length => {:minimum => ConfigCenter::GeneralValidations::FIRSTNAME_MIN_LEN,
        :maximum => ConfigCenter::GeneralValidations::FIRSTNAME_MAX_LEN,
        :message =>"First Name must be within 2 to 32"},
        :format => {:with => ConfigCenter::GeneralValidations::FIRSTNAME_FORMAT_REG_EXP,
          :message =>"User Name contains alphabets, numbers"}

  validates :last_name, presence: true, :length => {:minimum => ConfigCenter::GeneralValidations::LASTNAME_MIN_LEN,
            :maximum => ConfigCenter::GeneralValidations::LASTNAME_MAX_LEN,
            :message =>"Last Name must be within 2 to 32"},
            :format => {:with => ConfigCenter::GeneralValidations::LASTNAME_FORMAT_REG_EXP,
              :message =>"User Name contains alphabets, numbers"}

  validates :email, presence: true, uniqueness: {message: "Email already exists"},:format => {:with =>  ConfigCenter::GeneralValidations::EMAIL_FORMAT_REG_EXP,
                :message => "Invalid email"}


  validates :address, :presence => true

  validates :password, :presence => true, :on => :create

  validates :password, :format => {:with =>  ConfigCenter::GeneralValidations::PASSWORD_FORMAT_REG_EXP,
                      :message => "should have atleast 1 Character, 1 Number and 1 Special Character from (!,@,$,&,*,_)",
                      :multiline => true},
                      :length => {:minimum => ConfigCenter::GeneralValidations::PASSWORD_MIN_LEN,
                        :maximum => ConfigCenter::GeneralValidations::PASSWORD_MAX_LEN,
                        :message =>"Password must be within 8 to 128"}


  validates :password_confirmation, :presence => true, :on => :create



  validates :phone, :presence => true,:length => {:minimum => ConfigCenter::GeneralValidations::PHONE_MIN_LEN,
                  :maximum => ConfigCenter::GeneralValidations::PHONE_MAX_LEN,
                  :message =>"Phone Number must be 10 numbers and '-' For e.g: 990-191-6142"},
                  :format => {:with => ConfigCenter::GeneralValidations::PHONE_FORMAT_REG_EXP,
                    :message =>"Phone Number Contains Numbers and '-' For e.g: 990-191-6142"}





  def generate_auth_token
  begin
    self.auth_token = SecureRandom.hex
  end while self.class.exists?(auth_token: auth_token)
  end


  end
