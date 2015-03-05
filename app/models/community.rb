class Community < ActiveRecord::Base
  acts_as_inkwell_community
  validates :name, presence: true
  # validates :name, uniqueness: true

  has_attached_file :image, styles: { medium: '300x300>', thumb: '190x225>' }, default_url: 'no_image.png'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
