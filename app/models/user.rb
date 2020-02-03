# coding: utf-8
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validate :password_complexity

  def password_complexity
    return if password.blank? || password =~ /\A[a-z0-9]+\z/i
    errors.add :password, 'パスワードに、半角英数字を入力してください'
  end
end
