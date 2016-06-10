class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :place

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
end