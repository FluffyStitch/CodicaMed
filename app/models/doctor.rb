# frozen_string_literal: true

class Doctor < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  belongs_to :category
  has_many :appointments, dependent: :destroy
  has_many :users, through: :appointments

  validates :phone, :full_name, presence: true
  validates :phone, uniqueness: { case_sensitive: false }
  validates :phone, format: { with: ::Constants::PHONE_REGEX }

  include ImageUploader::Attachment(:avatar)

  protected

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end
end
