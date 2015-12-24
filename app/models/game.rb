class Game < ActiveRecord::Base
  belongs_to :host, class_name: 'User'

  VALID_VARIATIONS = ["holdem", "omaha", "7-card stud"]

  validates_presence_of :lat, :lng, :table_size, :host_id, :variation
  validate :variation_must_be_valid

  private

  def variation_must_be_valid
    unless VALID_VARIATIONS.include?(variation)
      errors.add(:invalid_variation, "poker variation is invalid")
    end
  end
end
