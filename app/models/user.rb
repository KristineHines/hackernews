require 'bcrypt'
class User < ActiveRecord::Base
  has_many :comments
  has_many :posts

  include BCrypt



  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(name, password)
    @user = find_by_username(name)
     if @user
      @user.password == password
      @user
    else
      nil
    end

  end

  # def self.authenticate(username, password)
  #   @user = User.find_by_email(username)
  #   if @user
  #     @user.password == password
  #   else
  #     nil
  #   end

  # end
end


