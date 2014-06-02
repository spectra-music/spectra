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
  factory :album do
    artist
    genres { [create(:genre)] }
    title 'Spectra'
    rating 5
    num_discs 1
    is_compilation false
    initialize_with { Album.find_or_create_by(title: title)}
    factory :album_with_tracks do
      after :create do |album, evaluator|
        create(:track, album: album)
      end
    end
  end
end
