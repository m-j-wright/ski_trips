# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  bio             :text
#  comments_count  :integer
#  email           :string
#  image           :string
#  password_digest :string
#  trips_count     :integer
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  #Direct Associations
  has_many(:trips, { :class_name => "Trip", :foreign_key => "user_id", :dependent => :destroy })
  has_many(:comments, { :class_name => "Comment", :foreign_key => "author_id", :dependent => :destroy })

  #Indirect Associations
  has_many(:mountains, { :through => :trips, :source => :mountain })

  #Validations
  validates(:username, { :presence => true })
  validates(:username, { :uniqueness => true })

end
