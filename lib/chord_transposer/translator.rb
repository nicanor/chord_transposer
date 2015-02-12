module ChordTransposer
  class Translator

    VALID_WORDS = Transposer::ALL + ['-', '(', ')', '/', '|', ',']

    def initialize(semitones=0, notation: :latin, response: :text)
      @transposer = Transposer.new(semitones, notation)
      @response = response
    end

    def call(line)
      if valid?(line)
        line.gsub(Transposer::REGEXP) do |chord|
          transpose($&)
        end
      else
        line
      end
    end

    def valid?(line)
      line.split.all?{|word| VALID_WORDS.include? word.capitalize}
    end

    def transpose(chord)
      if @response == :text
        @transposer.call(chord)
      else
        "<span class=\"chord\">#{@transposer.call(chord)}</span>"
      end
    end

  end
end