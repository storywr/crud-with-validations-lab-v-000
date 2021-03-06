class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :release_year, uniqueness: true

  with_options if: :released do |song|
    song.validates :release_year, presence: true
    song.validates(:release_year, { :numericality => { :less_than_or_equal_to => Date.today.year}})
  end

end
