class Photo < ActiveRecord::Base
  has_and_belongs_to_many :hashtags
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

  validates :image, presence: true
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  after_save :process_hashtags

  def process_hashtags
    tags = caption.scan(/\B#\w+/)

    self.hashtags = tags.map do |tag|
      Hashtag.find_or_create_by text: tag
    end
  end
end