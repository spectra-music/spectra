#!/usr/bin/env ruby
require 'taglib'
require 'pp'

# In order to ease getting info for all tag types,
# we define an interface 'Hashable' which contains
# .to_hash which returns a Map<Symbol, List<String>>


# Adding onto class
class TagLib::Tag
  # Converts the tag info to a hash
  def to_hash
    {
      title:   [title],
      album:   [album],
      artist:  [artist],
      comment: [comment],
      genre:   [genre],
      track:   [track == 0 ? nil : track.to_s],
      year:    [year == 0 ? nil : year.to_s]
    }
  end
end



class TagLib::ID3v2::Tag
  def to_hash
    map = {}
    frame_list.each { |fl| map[fl.frame_id] = [fl.to_string] }
    map
  end
end

class TagLib::Ogg::XiphComment
  def to_hash
    map = field_list_map
    pp contains? 'PICTURE'
    map
    # map.keys.each do |key|
    #   map[(key.downcase.to_sym rescue key) || key] = map.delete(key)
    # end
    # map
  end
end

# Handle all the file types we can do.

def file_handler
  proc do |file|
    tag = file.id3v2_tag || file.id3v1_tag || file.xiph_comment || file.tag
    pp tag.to_hash
  end
end


def read_track(path)
  # fileref_handler = file_handler do |fr|
  #   unless fr.null?
  #     pp fr.tag.to_hash
  #     #pp to_hash(fileref.audio_properties)
  #   end
  # end

  case File.extname(path)
  when '.flac'
    puts 'FLAC!'
    #handler = file_handler(:id3v2_tag)
    TagLib::FLAC::File.open(path, &file_handler)
  when '.m4a', '.aac', '.mp4'
    puts 'MP4!'
  when '.mp3'
    puts 'MP3!'
    TagLib::MPEG::File.open(path, &file_handler)
  else
    puts 'IDK!'
  end

end

def main
  # Die quickly
  if ARGV[0].nil?
    puts 'Needs an argument'
    exit(-1)
  end

  path = ARGV[0]
  read_track(path)
  exit(1)
end

main
