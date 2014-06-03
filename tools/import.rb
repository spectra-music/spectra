#!/usr/bin/env ruby
require 'taglib'
require 'pp'
require 'active_support/core_ext/string/inflections'

class BiWordHash
  def initialize(initial={})
    @forward = {}
    @reverse = {}
    initial.each_pair do |k,v|
      v = v.parameterize.underscore.to_sym
      k = k.to_sym
      @forward[k] = v
      @reverse[v] = k
    end
  end

  def insert(k, v)
    @forward[k] = v
    @reverse[v] = k
    v
  end

  def fetch(k)
    @forward[k]
  end

  def rfetch(v)
    @reverse[v]
  end

  def [](k)
    fetch(k)
  end

  def []=(k,v)
    insert(k,v)
  end

  def has_key?(k)
    @forward.has_key? k
  end

  def has_value?(v)
    @reverse.has_key? v
  end
end

# In order to ease getting info for all tag types,
# we define an interface 'Hashable' which contains
# .to_hash which returns a Map<Symbol, List<String>>

ID3V2_FRAME_SPEC = BiWordHash.new({
    'AENC' => 'Audio encryption',
    'APIC' => 'Attached picture',
    'ASPI' => 'Audio seek point index',
    'COMM' => 'Comments',
    'COMR' => 'Commercial frame',
    'ENCR' => 'Encryption method registration',
    'EQU2' => 'Equalization (2)',
    'EQUA' => 'Equalization',
    'ETCO' => 'Event timing codes',
    'GEOB' => 'General encapsulated object',
    'GRID' => 'Group identification registration',
    'IPLS' => 'Involved people list',
    'LINK' => 'Linked information',
    'MCDI' => 'Music CD identifier',
    'MLLT' => 'MPEG location lookup table',
    'OWNE' => 'Ownership frame',
    'PRIV' => 'Private frame',
    'PCNT' => 'Play counter',
    'POPM' => 'Popularimeter',
    'POSS' => 'Position synchronisation frame',
    'RBUF' => 'Recommended buffer size',
    'RVA2' => 'Relative volume adjustment (2)',
    'RVAD' => 'Relative volume adjustment',
    'RVRB' => 'Reverb',
    'SEEK' => 'Seek frame',
    'SIGN' => 'Signature frame',
    'SYLT' => 'Synchronized lyric/text',
    'SYTC' => 'Synchronized tempo codes',
    'TALB' => 'Album',
    'TBPM' => 'Beats per minute (BPM)',
    'TCOM' => 'Composer',
    'TCON' => 'Genre',
    'TCOP' => 'Copyright message',
    'TDAT' => 'Date',
    'TDLY' => 'Playlist delay',
    'TDOR' => 'Original release time',
    'TDRC' => 'Recorded on',
    'TDRL' => 'Released on',
    'TDTG' => 'Tagged on',
    'TENC' => 'Encoded by',
    'TEXT' => 'Lyricist',
    'TFLT' => 'File type',
    'TIME' => 'Time',
    'TIPL' => 'Involved people list',
    'TIT1' => 'Content group description',
    'TIT2' => 'Title',
    'TIT3' => 'Subtitle/Description refinement',
    'TKEY' => 'Initial key',
    'TLAN' => 'Language',
    'TLEN' => 'Length',
    'TMVL' => 'Musician credits list',
    'TMED' => 'Media type',
    'TMOO' => 'Mood',
    'TOAL' => 'Original album/movie/show title',
    'TOFN' => 'Original filename',
    'TOLY' => 'Original lyricist',
    'TOPE' => 'Original artist',
    'TORY' => 'Original release year',
    'TOWN' => 'File owner/licensee',
    'TPE1' => 'Artist',
    'TPE2' => 'Album artist',
    'TPE3' => 'Conductor',
    'TPE4' => 'Interpreted, remixed, or otherwise modified by',
    'TPOS' => 'Disc number',
    'TPUB' => 'Publisher',
    'TRCK' => 'Track number',
    'TRDA' => 'Recording dates',
    'TRSN' => 'Internet radio station name',
    'TRSO' => 'Internet radio station owner',
    'TSOA' => 'Sort album',
    'TSOP' => 'Sort artist',
    'TSOT' => 'Sort title',
    'TSIZ' => 'Size',
    'TSRC' => 'International Standard Recording Code (ISRC)',
    'TSSE' => 'Software/Hardware and settings used for encoding',
    'TSST' => 'Set subtitle',
    'TYER' => 'Year',
    'TXXX' => 'User defined text information frame',
    'UFID' => 'Unique file identifier',
    'USER' => 'Terms of use',
    'USLT' => 'Unsynchronized lyric/text transcription',
    'WCOM' => 'Commercial information',
    'WCOP' => 'Copyright/Legal information',
    'WOAF' => 'Official audio file webpage',
    'WOAR' => 'Official artist/performer webpage',
    'WOAS' => 'Official audio source webpage',
    'WORS' => 'Official internet radio station homepage',
    'WPAY' => 'Payment',
    'WPUB' => 'Publishers official webpage',
    'WXXX' => 'User defined URL link frame'
})

XIPH_COMMENT_FIELD_SPEC = BiWordHash.new({
    'TITLE' => 'Title',
    'VERSION' => 'Version',
    'ALBUM' => 'Album',
    'TRACKNUMBER' => 'Track number',
    'ARTIST' => 'Artist',
    'PERFORMER' => 'Performer',
    'COPYRIGHT' => 'Copyright',
    'LICENSE' => 'License',
    'ORGANIZATION' => 'Organization',
    'DESCRIPTION' => 'Description',
    'GENRE' => 'Genre',
    'DATE' => 'Date',
    'LOCATION' => 'Location',
    'CONTACT' => 'Contact info',
    'ALBUMARTIST' => 'Album artist',
    'COMMENT' => 'Comment',
    'DISCNUMBER' => 'Disc number',
    'ISRC' => 'ISRC number'
})

module TagLib
  class Tag
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

  class ID3v2::Tag
    def to_hash
      puts "ID3v2"
      map = {}
      frame_list.each do |fl|
        frame_id = fl.frame_id
        unless frame_id.nil?
          key = ID3V2_FRAME_SPEC[frame_id.to_sym]
          map[key] = fl.to_string
        end
      end
      map
    end
  end


  class AudioProperties
    def to_hash
      {
          bitrate: bitrate,
          channels: channels,
          length: length,
          sample_rate: sample_rate
      }
    end
  end

  class FLAC::Properties
    def to_hash
      {
          sample_width: sample_width,
          signature: signature
      }.merge super.to_hash
    end
  end

  class MP4::Properties
    def to_hash
      {
          bits_per_sample: bits_per_sample,
          encrypted: encrypted?
      }.merge super.to_hash
    end
  end

  class MPEG::Properties
    def to_hash
      map = {
          copyrighted: copyrighted?,
          layer: layer,
          original: original?,
          protection_enabled: protection_enabled
      }

      unless xing_header.nil?
        map.merge({ total_frames: xing_header.total_frames,
                    total_size: xing_header.total_size,
                    valid_xing_header: xing_header.valid? })
      end
      map.merge super.to_hash
    end
  end

  module Ogg
    class Vorbis::Properties
      def to_hash
        {
            bitrate_maximum: bitrate_maximum,
            bitrate_minimum: bitrate_minimum,
            bitrate_nominal: bitrate_nominal,
            vorbis_version: vorbis_version
        }.merge super.to_hash
      end
    end

    class XiphComment
      def to_hash
        map = { vendor_id: vendor_id }
        field_list_map.each_pair do |k, v|
          key = XIPH_COMMENT_FIELD_SPEC.has_key?(k.to_sym) ? XIPH_COMMENT_FIELD_SPEC[k.to_sym] : k.to_sym
          map[key] = v.size == 1 ? v.first : v
        end
        map
      end
    end
  end

end

# Handle all the file types we can do.

def file_handler
  proc do |file|
    tag = file.id3v2_tag || file.id3v1_tag || file.xiph_comment || file.tag
    puts "Tags: "
    pp tag.to_hash
    properties = file.audio_properties
    puts "Properties: "
    pp properties.to_hash
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
    puts 'Found a FLAC!'
    TagLib::FLAC::File.open(path, &file_handler)
  when '.m4a', '.aac', '.mp4'
    puts 'Found a MP4!'
  when '.mp3'
    puts 'Found a MP3!'
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
