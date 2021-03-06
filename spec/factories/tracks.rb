FactoryGirl.define do
  factory :track do
    title 'Spectra'
    artist
    album
    genres {[create(:genre)]}
    #length "3:56"
    track_id 1
    disc_id 1
    location '/mnt/Data/Music/Chipzel/Spectra/Spectra.flac'
    #format "flac"
    rating 5
    initialize_with { Track.find_or_create_by(title: title, artist: artist, album: album)}
  end
end