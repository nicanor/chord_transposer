# encoding: utf-8
require 'spec_helper'

describe ChordTransposer::Translator do
  describe ".call" do
    it "changes simple line" do
      translator = ChordTransposer::Translator.new(2)
      expect(translator.call("do re mi")).to eq("Re Mi Fa#")
    end

    it "respects spaces between words" do
      translator = ChordTransposer::Translator.new(2)
      expect(translator.call("do    re")).to eq("Re    Mi")
    end

    it "ignores invalid lines" do
      translator = ChordTransposer::Translator.new(2)
      expect(translator.call("error do re mi fa sol la si")).to eq("error do re mi fa sol la si")
    end

    it "ignores hiphens" do
      translator = ChordTransposer::Translator.new(2)
      expect(translator.call("do - re - mi - fa - sol - la")).to eq("Re - Mi - Fa# - Sol - La - Si")
    end

    it "ignores other strange symbols" do
      translator = ChordTransposer::Translator.new(2)
      expect(translator.call("do , re | mi / fa ( sol ) la")).to eq("Re , Mi | Fa# / Sol ( La ) Si")
    end

    it "works with different notations" do
      translator = ChordTransposer::Translator.new(2, notation: :american)
      expect(translator.call("do , re | mi / fa ( sol ) la")).to eq("D , E | F# / G ( A ) B")
    end

    it "can return html response" do
      translator = ChordTransposer::Translator.new(2, response: :html)
      expect(translator.call("do")).to eq("<span class=\"chord\">Re</span>")
    end
  end
end