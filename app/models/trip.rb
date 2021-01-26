# == Schema Information
#
# Table name: trips
#
#  id             :integer          not null, primary key
#  comments_count :integer
#  date           :date
#  description    :text
#  image          :string
#  name           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  mountain_id    :integer
#  user_id        :integer
#
class Trip < ApplicationRecord

  #Direct Associations
  has_many(:comments, { :class_name => "Comment", :foreign_key => "trip_id", :dependent => :destroy })
  belongs_to(:mountain, { :required => false, :class_name => "Mountain", :foreign_key => "mountain_id", :counter_cache => true })
  belongs_to(:user, { :required => false, :class_name => "User", :foreign_key => "user_id", :counter_cache => true })

  #Validations
  validates(:user_id, { :presence => true })
  validates(:name, { :presence => true })
  validates(:name, { :uniqueness => { :scope => ["user_id"] } })
  validates(:mountain_id, { :presence => true })
  validates(:image, { :presence => true })

end
