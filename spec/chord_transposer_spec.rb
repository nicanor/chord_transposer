# encoding: utf-8
require 'spec_helper'

describe ChordTransposer do
  describe ".transpose" do
    it "changes 'do' to 're'" do
      transposer = ChordTransposer::Transposer.new(2)
      expect(transposer.transpose('do')).to eq('re')
    end
  end
end