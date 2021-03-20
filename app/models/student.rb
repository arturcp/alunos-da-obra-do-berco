# frozen_string_literal: true

class Student < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  enum status: { male: 0, female: 1 }
end
