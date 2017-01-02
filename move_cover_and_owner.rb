Event.all.each do |x|
  x.cover_source = x.cover.try(:[], 'source')
  x.owner_name = x.owner.try(:[], 'name')
  x.save!
end
