# frozen_string_literal: true

class Student < ApplicationRecord
  enum status: { male: 0, female: 1 }

  def avatar_src
    "data:image/png;base64,#{self.avatar}"
  end

  def cv_src
    "data:application/pdf;base64,#{self.cv}"
  end
end
