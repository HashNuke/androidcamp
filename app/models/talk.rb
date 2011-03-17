class Talk < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :dependent=>:destroy
  has_many :votes, :dependent=>:destroy

  validates_presence_of :title
  validates_presence_of :description

  def posted_on
    self.created_at.to_s(:long)
  end
  
end
