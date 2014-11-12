class Movie < ActiveRecord::Base

  has_many :reviews

  validates :title, presence: true
  validates :director, presence: true
  validates :runtime_in_minutes, numericality: { only_integer: true }
  validates :description, presence: true
  # validates :poster_image_url
  validates :release_date, presence: true
  validate :release_date_is_in_the_future

  mount_uploader :image, PosterUploader

  def review_average
    reviews.sum(:rating_out_of_ten)/reviews.size
  end

  def self.search(search)
    if search
      where('title LIKE :search OR director LIKE :search', { :search => "%#{search}%"})
    else
      nil
    end
  end

  def format_date 
     release_date.strftime("%m/%d/%Y")
  end 
  

  protected

  def release_date_is_in_the_future
    if release_date.present?
      errors.add(:release_date, "should probably be in the future") if release_date < Date.today
    end
  end

  #def self.wildcardify(string_to_wrap)
    # "%" + string_to_wrap.to_s + "%"
end

