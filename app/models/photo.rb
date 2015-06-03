class Photo < ActiveRecord::Base
  has_and_belongs_to_many :hashtags
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  after_save :process_hashtags
  validates :image, presence: true

  def process_hashtags
    tags = self.caption.scan(/\B#\w+/)
    tags.each do |tag|
      hashtag = Hashtag.where(:text => tag).first_or_create
      self.hashtags << hashtag
    end
  end

  def update_hashtags
    self.hashtags.destroy_all
    self.process_hashtags
  end
end