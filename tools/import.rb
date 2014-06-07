#!/usr/bin/env ruby
require 'taglib'
require 'pp'
require 'active_support/core_ext/string/inflections'
require 'chair'
require 'table_print'

I18n.enforce_available_locales = false

# In order to ease getting info for all tag types,
# we define an interface 'Hashable' which contains
# .to_hash which returns a Map<Symbol, List<String>>

ID_LOOKUP_TABLE = Chair.new :name, :slug
ID_LOOKUP_TABLE.set_primary_key! :name
ID_LOOKUP_TABLE.add_index! :slug

# ID3v24
# 'Involved people list' => 'TIPL',
ID_LOOKUP_TABLE.add_columns! :id3v2, :xiph, :mp4_itunes, :mp4v2

[
    ["Album Artist"                                     , nil  , "TPE2" , "ALBUMARTIST"  , "aART"     , "albumArtist"      ],
    ["Album"                                            , nil  , "TALB" , "ALBUM"        , "©alb"     , "album"            ],
    ["Artist"                                           , nil  , "TPE1" , "ARTIST"       , "©ART"     , "artist"           ],
    ["Attached picture"                                 , nil  , "APIC" , nil            , nil        , nil                ],
    ["Audio encryption"                                 , nil  , "AENC" , nil            , nil        , nil                ],
    ["Audio seek point index"                           , nil  , "ASPI" , nil            , nil        , nil                ],
    ["BPM"                                              , nil  , "TBPM" , nil            , "tmpo"     , "tempo"            ],
    ["Comments"                                         , nil  , "COMM" , nil            , nil        , nil                ],
    ["Commercial frame"                                 , nil  , "COMR" , nil            , nil        , nil                ],
    ["Commercial information"                           , nil  , "WCOM" , nil            , nil        , nil                ],
    ["Composer"                                         , nil  , "TCOM" , nil            , "©wrt"     , "composer"         ],
    ["Compilation"                                      , nil  , "TCMP" , nil            , "cpil"     , "compilation"      ],
    ["Conductor"                                        , nil  , "TPE3" , nil            , nil        , nil                ],
    ["Content group description"                        , nil  , "TIT1" , nil            , nil        , nil                ],
    ["Copyright"                                        , nil  , "TCOP" , "COPYRIGHT"    , "cprt"     , "copyright"        ],
    ["Copyright/Legal information"                      , nil  , "WCOP" , nil            , nil        , nil                ],
    ["Date"                                             , nil  , "TDAT" , "DATE"         , "©day"     , "releaseDate"      ],
    ["Disc Number"                                      , nil  , "TPOS" , "DISCNUMBER"   , "disk"     , "disk"             ],
    ["Encoded By"                                       , nil  , "TENC" , nil            , "©enc"     , "encodedBy"        ],
    ["Encryption method registration"                   , nil  , "ENCR" , nil            , nil        , nil                ],
    ["Equalization (2)"                                 , nil  , "EQU2" , nil            , nil        , nil                ],
    ["Equalization"                                     , nil  , "EQUA" , nil            , nil        , nil                ],
    ["Event timing codes"                               , nil  , "ETCO" , nil            , nil        , nil                ],
    ["File owner/licensee"                              , nil  , "TOWN" , nil            , nil        , nil                ],
    ["File type"                                        , nil  , "TFLT" , nil            , nil        , nil                ],
    ["General encapsulated object"                      , nil  , "GEOB" , nil            , nil        , nil                ],
    ["Genre"                                            , nil  , "TCON" , "GENRE"        , nil        , nil                ],
    ["Group identification registration"                , nil  , "GRID" , nil            , nil        , nil                ],
    ["Initial key"                                      , nil  , "TKEY" , nil            , nil        , nil                ],
    ["International Standard Recording Code (ISRC)"     , nil  , "TSRC" , nil            , nil        , nil                ],
    ["Internet radio station name"                      , nil  , "TRSN" , nil            , nil        , nil                ],
    ["Internet radio station owner"                     , nil  , "TRSO" , nil            , nil        , nil                ],
    ["Interpreted, remixed, or otherwise modified by"   , nil  , "TPE4" , nil            , nil        , nil                ],
    ["Involved people list"                             , nil  , "IPLS" , nil            , nil        , nil                ],
    ["Language"                                         , nil  , "TLAN" , nil            , nil        , nil                ],
    ["Length"                                           , nil  , "TLEN" , nil            , nil        , nil                ],
    ["Linked information"                               , nil  , "LINK" , nil            , nil        , nil                ],
    ["Lyricist"                                         , nil  , "TEXT" , nil            , nil        , nil                ],
    ["Media type"                                       , nil  , "TMED" , nil            , nil        , nil                ],
    ["Mood"                                             , nil  , "TMOO" , nil            , nil        , nil                ],
    ["MPEG location lookup table"                       , nil  , "MLLT" , nil            , nil        , nil                ],
    ["Music CD identifier"                              , nil  , "MCDI" , nil            , nil        , nil                ],
    ["Musician credits list"                            , nil  , "TMVL" , nil            , nil        , nil                ],
    ["Official artist/performer webpage"                , nil  , "WOAR" , nil            , nil        , nil                ],
    ["Official audio file webpage"                      , nil  , "WOAF" , nil            , nil        , nil                ],
    ["Official audio source webpage"                    , nil  , "WOAS" , nil            , nil        , nil                ],
    ["Official internet radio station homepage"         , nil  , "WORS" , nil            , nil        , nil                ],
    ["Original album/movie/show title"                  , nil  , "TOAL" , nil            , nil        , nil                ],
    ["Original artist"                                  , nil  , "TOPE" , nil            , nil        , nil                ],
    ["Original filename"                                , nil  , "TOFN" , nil            , nil        , nil                ],
    ["Original lyricist"                                , nil  , "TOLY" , nil            , nil        , nil                ],
    ["Original release time"                            , nil  , "TDOR" , nil            , nil        , nil                ],
    ["Original release year"                            , nil  , "TORY" , nil            , nil        , nil                ],
    ["Ownership frame"                                  , nil  , "OWNE" , nil            , nil        , nil                ],
    ["Payment"                                          , nil  , "WPAY" , nil            , nil        , nil                ],
    ["Play counter"                                     , nil  , "PCNT" , nil            , nil        , nil                ],
    ["Playlist delay"                                   , nil  , "TDLY" , nil            , nil        , nil                ],
    ["Popularimeter"                                    , nil  , "POPM" , nil            , nil        , nil                ],
    ["Position synchronisation frame"                   , nil  , "POSS" , nil            , nil        , nil                ],
    ["Private frame"                                    , nil  , "PRIV" , nil            , nil        , nil                ],
    ["Publisher"                                        , nil  , "TPUB" , nil            , nil        , nil                ],
    ["Publishers official webpage"                      , nil  , "WPUB" , nil            , nil        , nil                ],
    ["Recommended buffer size"                          , nil  , "RBUF" , nil            , nil        , nil                ],
    ["Recorded on"                                      , nil  , "TDRC" , nil            , nil        , nil                ],
    ["Recording dates"                                  , nil  , "TRDA" , nil            , nil        , nil                ],
    ["Relative volume adjustment (2)"                   , nil  , "RVA2" , nil            , nil        , nil                ],
    ["Relative volume adjustment"                       , nil  , "RVAD" , nil            , nil        , nil                ],
    ["Released on"                                      , nil  , "TDRL" , nil            , nil        , nil                ],
    ["Reverb"                                           , nil  , "RVRB" , nil            , nil        , nil                ],
    ["Seek frame"                                       , nil  , "SEEK" , nil            , nil        , nil                ],
    ["Set subtitle"                                     , nil  , "TSST" , nil            , nil        , nil                ],
    ["Signature frame"                                  , nil  , "SIGN" , nil            , nil        , nil                ],
    ["Size"                                             , nil  , "TSIZ" , nil            , nil        , nil                ],
    ["Software/Hardware and settings used for encoding" , nil  , "TSSE" , nil            , nil        , nil                ],
    ["Sort Album"                                       , nil  , "TSOA" , nil            , "soal"     , "sortAlbum"        ],
    ["Sort Artist"                                      , nil  , "TSOP" , nil            , "soar"     , "sortArtist"       ],
    ["Sort Title"                                       , nil  , "TSOT" , nil            , "sonm"     , "sortName"         ],
    ["Subtitle/Description refinement"                  , nil  , "TIT3" , nil            , nil        , nil                ],
    ["Synchronized lyric/text"                          , nil  , "SYLT" , nil            , nil        , nil                ],
    ["Synchronized tempo codes"                         , nil  , "SYTC" , nil            , nil        , nil                ],
    ["Tagged on"                                        , nil  , "TDTG" , nil            , nil        , nil                ],
    ["Terms of use"                                     , nil  , "USER" , nil            , nil        , nil                ],
    ["Time"                                             , nil  , "TIME" , nil            , nil        , nil                ],
    ["Title"                                            , nil  , "TIT2" , "TITLE"        , "©nam"     , "name"             ],
    ["Track Number"                                     , nil  , "TRCK" , "TRACKNUMBER"  , "trkn"     , "track"            ],
    ["Unique file identifier"                           , nil  , "UFID" , nil            , nil        , nil                ],
    ["Lyrics"                                           , nil  , "USLT" , nil            , "©lyr"     , "lyrics"           ],
    ["User defined text information frame"              , nil  , "TXXX" , nil            , nil        , nil                ],
    ["User defined URL link frame"                      , nil  , "WXXX" , nil            , nil        , nil                ],
    ["Year"                                             , nil  , "TYER" , nil            , nil        , nil                ],
    ["Version"                                          , nil  , nil    , "VERSION"      , nil        , nil                ],
    ["Performer"                                        , nil  , nil    , "PERFORMER"    , nil        , nil                ],
    ["License"                                          , nil  , nil    , "LICENSE"      , nil        , nil                ],
    ["Organization"                                     , nil  , nil    , "ORGANIZATION" , nil        , nil                ],
    ["Description"                                      , nil  , nil    , "DESCRIPTION"  , "desc"     , "description"      ],
    ["Location"                                         , nil  , nil    , "LOCATION"     , nil        , nil                ],
    ["Contact Info"                                     , nil  , nil    , "CONTACT"      , nil        , nil                ],
    ["Comment"                                          , nil  , nil    , "COMMENT"      , "©cmt"     , "comments"         ],
    ["ISRC Number"                                      , nil  , nil    , "ISRC"         , nil        , nil                ],
    ["Grouping"                                         , nil  , nil    , nil            , "©grp"     , "grouping"         ],
    ["Genre, Pre-defined"                               , nil  , nil    , nil            , "gnre"     , "genre"            ],
    ["Genre, User defined"                              , nil  , nil    , nil            , "©gen"     , "genre"            ],
    ["Long description"                                 , nil  , nil    , nil            , "ldes"     , "longDescription"  ],
    ["Sort Album Artist"                                , nil  , nil    , nil            , "soaa"     , "sortAlbumArtist"  ],
    ["Sort Composer"                                    , nil  , nil    , nil            , "soco"     , "sortComposer"     ],
    ["Cover Art"                                        , nil  , nil    , nil            , "covr"     , "artwork"          ],
    ["Encoding Tool"                                    , nil  , nil    , nil            , "©too"     , "encodingTool"     ],
    ["Purchase Date"                                    , nil  , nil    , nil            , "purd"     , "purchaseDate"     ],
    ["Podcast"                                          , nil  , nil    , nil            , "pcst"     , "podcast"          ],
    ["Podcast URL"                                      , nil  , nil    , nil            , "purl"     , nil                ],
    ["Keywords"                                         , nil  , nil    , nil            , "keyw"     , "keywords"         ],
    ["Category"                                         , nil  , nil    , nil            , "catg"     , "category"         ],
    ["Media Type"                                       , nil  , nil    , nil            , "stik"     , "mediaType"        ],
    ["Content Rating"                                   , nil  , nil    , nil            , "rtng"     , "contentRating"    ],
    ["Gapless Playback"                                 , nil  , nil    , nil            , "pgap"     , "gapless"          ],
].each { |row| ID_LOOKUP_TABLE.insert! row }

def rl(col)
  lambda { |r| r[col].inspect }
end

tp.set :max_width, 80 # columns won't exceed 80 characters
tp ID_LOOKUP_TABLE.all.map { |r| r.to_hash }, {:name => rl(:name)}, {:slug => rl(:slug)}, {:id3v2 => rl(:id3v2)}, {:xiph => rl(:xiph)}, {:mp4_itunes => rl(:mp4_itunes)}, {:mp4v2 => rl(:mp4v2)}

module TagLib
  class Tag
    # Converts the tag info to a hash
    def to_hash
      {
          title: [title],
          album: [album],
          artist: [artist],
          comment: [comment],
          genre: [genre],
          track: [track == 0 ? nil : track.to_s],
          year: [year == 0 ? nil : year.to_s]
      }
    end
  end

  class ID3v2::Tag
    def to_hash
      puts 'ID3v2'
      map = {}
      frame_list.each do |fl|
        frame_id = fl.frame_id
        unless frame_id.nil?
          key = ID_LOOKUP_TABLE.find_by(id3v2: frame_id)
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

  module MP4
    class ItemListMap
      def to_hash
        map = {}
        to_a.each do |e|
          if map.has_key? map[e[0]]
            map[e[0]] <<= e[1]
          else
            map[e[0]] = [e[1]]
          end
        end
        map
      end
    end
    class Tag
      def to_hash
        item_list_map.to_hash
      end
    end
    class Properties
      def to_hash
        {
            bits_per_sample: bits_per_sample,
        }.merge super.to_hash
      end
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
        map.merge({total_frames: xing_header.total_frames,
                   total_size: xing_header.total_size,
                   valid_xing_header: xing_header.valid?})
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
        map = {vendor_id: vendor_id}
        field_list_map.each_pair do |k, v|
          key = XIPH_COMMENT_FIELD_SPEC.has_key?(k) ? XIPH_COMMENT_FIELD_SPEC[k] : k.downcase.to_sym
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
    case file
      when TagLib::MP4::File
        tag = file.tag
      else
        tag = file.id3v2_tag || file.id3v1_tag || file.xiph_comment || file.tag
    end
    puts 'Tags: '
    pp tag.to_hash
    properties = file.audio_properties
    puts 'Properties: '
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
      TagLib::MP4::File.open(path, &file_handler)
    when '.mp3'
      puts 'Found a MP3!'
      TagLib::MPEG::File.open(path, &file_handler)
    when '.ogg'
      puts 'Found an OGG!'
      TagLib::Ogg::Vorbis::File.open(path, &file_handler)
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
