class Place < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :photos
  geocoded_by :address
  after_validation :geocode
  validates :name, presence: true, length: { minimum: 3 }
  validates :address, presence: true
  validates :description, presence: true

  def self.search(search)
    if search
      find(:all, conditions: ['name ILIKE ? OR description ILIKE ? OR address ILIKE', "%#{search}%", "%#{search}%", "%#{search}%"])
    else
      find(:all)
    end
  end
end
