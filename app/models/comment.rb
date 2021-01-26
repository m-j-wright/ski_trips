# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :integer
#  trip_id    :integer
#
class Comment < ApplicationRecord

  #Direct Associations
  belongs_to(:trip, { :required => false, :class_name => "Trip", :foreign_key => "trip_id", :counter_cache => true })
  belongs_to(:author, { :required => false, :class_name => "User", :foreign_key => "author_id", :counter_cache => true })

  #Indirect Associations


  #Validations
  


end
