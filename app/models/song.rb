class Song < ActiveRecord::Base
  validates :title, length: { minimum: 1}
  validates :released, inclusion: { in: [true, false]}
  validates :release_year, numericality: {less_than_or_equal_to: Date.today.year }, if: :released?
  

  def released?
    self.released = true
  end

  def not_released?
    self.released = false
  end

end
