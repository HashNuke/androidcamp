class Comment < ActiveRecord::Base
  belongs_to :talk
  belongs_to :user

  validates_presence_of :user_id
  validates_presence_of :talk_id
  validates_presence_of :description, :message=>"Saying nothing doesn't require a comment ;)"
  # TODO counter_cache broken in rails v3.0.5
  before_create :increment_comments_count
  after_destroy :decrement_comments_count

  def posted_on
    self.created_at.strftime("%d-%b-%Y, %I:%M %p ")
  end
  
  private
  def increment_comments_count
    talk = self.talk
    talk.comments_count = talk.comments_count.succ
    talk.save
  end

  def decrement_comments_count
    talk = self.talk
    talk.comments_count = talk.comments_count.pred
    talk.save
  end
  
end
