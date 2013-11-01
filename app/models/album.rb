class Album < ActiveRecord::Base
  belongs_to :user
  has_many :pictures, :dependent => :destroy
  attr_accessible :title
end
