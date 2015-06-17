class Snippet < ActiveRecord::Base

  belongs_to :category

  validates_presence_of :title, :code

  def self.search(term)
    where(["title ILIKE ? OR code ILIKE ?", "%#{term}%", "%#{term}%"])
  end

end
