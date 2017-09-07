json.array! @locations do |location|
  json.lat location.latitude
  json.lng location.longitude
  json.title location.city
  json.content LocationsController.render(partial: 'locations/members', locals: { location: location }, format: :html).squish
end
