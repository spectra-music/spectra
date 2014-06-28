# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140628031625) do

  create_table "albums", force: true do |t|
    t.string   "title"
    t.integer  "rating"
    t.integer  "artist_id"
    t.date     "release_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_compilation"
    t.integer  "num_discs"
    t.string   "slug"
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
  end

  add_index "albums", ["slug"], name: "index_albums_on_slug", unique: true
  add_index "albums", ["title"], name: "index_albums_on_title", unique: true

  create_table "albums_genres", id: false, force: true do |t|
    t.integer "album_id", null: false
    t.integer "genre_id", null: false
  end

  create_table "artists", force: true do |t|
    t.string   "name"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "artists", ["name"], name: "index_artists_on_name", unique: true
  add_index "artists", ["slug"], name: "index_artists_on_slug", unique: true

  create_table "flexlists", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "genres", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "genres", ["slug"], name: "index_genres_on_slug", unique: true

  create_table "genres_tracks", id: false, force: true do |t|
    t.integer "genre_id", null: false
    t.integer "track_id", null: false
  end

  create_table "playlist_tracks", force: true do |t|
    t.integer  "track_num"
    t.integer  "track_id"
    t.integer  "playable_id"
    t.string   "playable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "playlists", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rules", force: true do |t|
    t.string   "field"
    t.integer  "type"
    t.string   "value_start"
    t.string   "value_end"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", force: true do |t|
    t.string   "var",                   null: false
    t.text     "value"
    t.integer  "thing_id"
    t.string   "thing_type", limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "settings", ["thing_type", "thing_id", "var"], name: "index_settings_on_thing_type_and_thing_id_and_var", unique: true

  create_table "tracks", force: true do |t|
    t.string   "title"
    t.integer  "rating"
    t.integer  "artist_id"
    t.integer  "album_id"
    t.date     "date"
    t.string   "location"
    t.float    "bitrate"
    t.text     "lyrics"
    t.integer  "track_id"
    t.integer  "disc_id"
    t.string   "format"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "tracks", ["slug"], name: "index_tracks_on_slug", unique: true

end
