require 'pry'
require './lib/date.rb'

class KeyGen
  attr_reader :time,
              :key,
              :offset,
              :key_a,
              :key_b,
              :key_c,
              :key_d

  def initialize
    @date = Date.new
    @key  = self.key_generator
  end

  def key_generator
    chars = *(0..9)
    (1..5).map {chars.sample}.join
  end

  def time
    time = Time.new
    time = time.strftime("%d%m%y")
  end


  def offset
    offset = ((self.time.to_i) ** 2).to_s
    offset.split(//).last(4).join
  end

  def key_a
    key_a = key[0] + key[1]
    key_a.to_i + offset[0].to_i
  end

  def key_b
    key_b = key[1] + key[2]
    key_b.to_i + offset[1].to_i
  end

  def key_c
    key_c = key[2] + key[3]
    key_c.to_i + offset[2].to_i
  end

  def key_d
    key_d = key[3] + key[4]
    key_d.to_i + offset[3].to_i
  end

  def rotate(key)
    characters = ((' '..'z').to_a + ('😀'..'😾').to_a + ["🖕"])
    rotated_characters = characters.rotate(key.to_i).to_a
    Hash[characters.zip(rotated_characters)]
  end
  
end