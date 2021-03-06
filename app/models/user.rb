# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime
#  updated_at             :datetime
#  avatar_file_name       :string
#  avatar_content_type    :string
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#  facebook_link          :string
#  twitter_link           :string
#  vine_link              :string
#  username               :string
#  follower_count         :integer          default("0")
#  following_count        :integer          default("0")
#  community_count        :integer          default("0")
#

class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # has_many :communities, dependent: :destroy
  # has_many :communities_users, :class_name => 'Inkwell::CommunityUser', dependent: :destroy
  has_many :posts
  acts_as_inkwell_user
  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100#' }, default_url: 'avatar.gif'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  validates :username, presence: true
  validates :username, uniqueness: true
end
