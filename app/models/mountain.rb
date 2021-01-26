# == Schema Information
#
# Table name: mountains
#
#  id          :integer          not null, primary key
#  image       :string
#  name        :string
#  trips_count :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Mountain < ApplicationRecord

  #Direct Associations
  has_many(:trips, { :class_name => "Trip", :foreign_key => "mountain_id", :dependent => :destroy })

  #Indirect Associations
  has_many(:users, { :through => :trips, :source => :user })

  #Validations


end
