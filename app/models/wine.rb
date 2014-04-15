class Wine < ActiveRecord::Base
	VARIETALS = ['Cabernet Sauvignon', 'Chardonnay', 'Merlot', 'Moscato', 'Pinot', 'Pinot Noir', 'Riesling']
	validates :name, :year, :country, :varietal, presence: true
	validates :year,
	  numericality: {only_integer: true, greater_than_or_equal_to: 0},
	  unless: "pages.blank?"
	validates :varietal, :inclusion => {:in => VARIETALS}  	
end
