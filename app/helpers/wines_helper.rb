module WinesHelper

def format_average_rating(wine)
  average = wine.average_rating
  if average
    pluralize(number_with_precision(average, precision: 1), 'rating')
  else
    'No log entries'
  end
end

end