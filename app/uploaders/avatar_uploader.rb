# frozen_string_literal: true

class AvatarUploader < CarrierWave::Uploader::Base
  storage :postgresql_lo

  def store_dir
    "image-#{Rails.env}/#{model.class.name}/#{model.try(:name) || Time.now.strftime('%Y-%m-%d_%H-%M-%S')}"
  end
end
