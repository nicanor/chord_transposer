module ChordTransposer
  class Transposer

    REGEXP = /(?<tone>Do#|Do|Re#|Re|Mi|Fa#|Fa|Sol#|Sol|La#|La|Si)(?<mode>m|7|)/i

    CHORDS = ['Do', 'Do#', 'Re', 'Re#', 'Mi', 'Fa', 'Fa#', 'Sol', 'Sol#', 'La', 'La#', 'Si']

    def initialize(semitones=0)
      @semitones = semitones
    end

    def transpose(chord)
      match = REGEXP.match chord
      tone  = match[:tone]
      mode  = match[:mode]
      index = CHORDS.index(tone)
      CHORDS[(index + @semitones)%12] + mode
    end
  end
end