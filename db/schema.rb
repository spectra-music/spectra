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

ActiveRecord::Schema.define(version: 20140529200816) do

  create_table "albums", force: true do |t|
    t.string   "title"
    t.integer  "rating"
    t.integer  "artist_id"
    t.binary   "art"
    t.date     "release_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_compilation"
    t.integer  "num_discs"
    t.integer  "num_tracks"
  end

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
  end

  add_index "artists", ["name"], name: "index_artists_on_name", unique: true

  create_table "genres", force: true do |t|
    t.string   "CreateGenres"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "genres_tracks", id: false, force: true do |t|
    t.integer "genre_id", null: false
    t.integer "track_id", null: false
  end

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
  end

end
