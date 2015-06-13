class Snippet < ActiveRecord::Base

  belongs_to :category

  validates_presence_of :title, :code

end
