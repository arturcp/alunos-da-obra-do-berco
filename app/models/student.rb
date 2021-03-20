# frozen_string_literal: true

class Student < ApplicationRecord
  enum status: { male: 0, female: 1 }
end
