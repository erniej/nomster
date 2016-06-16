class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :place
  after_create :send_comment_email

  RATINGS = {
    'one star'    => '1_star',
    'two star'    => '2_star',
    'three star'  => '3_star',
    'four star'   => '4_star',
    'five star'   => '5_star'
  }

  def humanized_rating
    RATINGS.invert[self.rating]
  end

  def send_comment_email
    NotificationMailer.comment_added(self).deliver
  end
end