# saved_single_instances = {}
# #Find or create the model instance
# single_instances = lambda do |factory_key|
#   begin
#     saved_single_instances[factory_key].reload
#   rescue NoMethodError, ActiveRecord::RecordNotFound
#     #was never created (is nil) or was cleared from db
#     saved_single_instances[factory_key] = Factory.create(factory_key)  #recreate
#   end
#
#   return saved_single_instances[factory_key]
# end

FactoryGirl.define do
  factory :artist do
    name 'Chipzel'
    rating 5
    initialize_with { Artist.find_or_create_by(name: name)}
  end

  factory :album do
    artist
    title 'Spectra'
    rating 5
    num_tracks 13
    num_discs 1
    is_compilation false
    initialize_with { Album.find_or_create_by(title: title)}
  end

  factory :track do
    title 'Spectra'
    artist
    album
    #length "3:56"
    track_id 1
    disc_id 1
    location '/mnt/Data/Music/Chipzel/Spectra/Spectra.flac'
    #format "flac"
  end
end