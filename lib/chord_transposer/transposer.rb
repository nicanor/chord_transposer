module ChordTransposer
  class Transposer

    REGEXP = /(?<tone>Do#|Do|Reb|Re#|Re|Mib|Mi|Fa#|Fa|Solb|Sol#|Sol|Lab|La#|La|Sib|Si|C#|C|Db|D#|D|Eb|E|F#|F|Gb|G#|G|Ab|A#|A|Bb|B)(?<mode>m7|m|7|)/i

    LATIN          = ['Do', 'Do#', 'Re', 'Re#', 'Mi', 'Fa', 'Fa#',  'Sol', 'Sol#', 'La', 'La#', 'Si']
    AMERICAN       = ['C',  'C#',  'D',  'D#',  'E',  'F',  'F#',   'G',   'G#',   'A',  'A#',  'B' ]
    LATIN_BEMOL    = ['Do', 'Reb', 'Re', 'Mib', 'Mi', 'Fa', 'Solb', 'Sol', 'Lab',  'La', 'Sib', 'Si']
    AMERICAN_BEMOL = ['C',  'Db',  'D',  'Eb',  'E',  'F',  'Gb',   'G',   'Ab',   'A',  'Bb',  'B' ]


    ALL = LATIN + AMERICAN + LATIN_BEMOL + AMERICAN_BEMOL

    def initialize(semitones=0, notation=:latin)
      @array = if notation == :latin
        LATIN.rotate(semitones)
      else
        AMERICAN.rotate(semitones)
      end
    end

    def transpose(chord)
      match = REGEXP.match chord.capitalize
      index = ALL.index(match[:tone])%12
      @array[index] + match[:mode]
    end
  end
end