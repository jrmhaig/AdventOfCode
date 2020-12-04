#!/bin/env ruby

class Passport
  attr_writer :rules

  def initialize data
    @data = data.split(/\s+/).map { |datum| datum.split(':') }.to_h.transform_keys(&:to_sym)
    @rules = {}
  end

  def valid?
    @rules.each_pair.inject(true) do |result, (key, rule)|
      result && rule.call(@data[key])
    end
  end
end

passwords = File.read('day_four_input.txt')
  .split("\n\n")
  .map { |data| Passport.new(data) }

rules = {
  byr: ->(value) { value },
  iyr: ->(value) { value },
  eyr: ->(value) { value },
  hgt: ->(value) { value },
  hcl: ->(value) { value },
  ecl: ->(value) { value },
  pid: ->(value) { value }
}
puts "1) #{passwords.select { |passport|
  passport.rules = rules
  passport.valid?
}.count}"

rules = {
  byr: ->(value) { value&.match(/^\d{4}$/) && value.to_i.between?(1920, 2002) },
  iyr: ->(value) { value&.match(/^\d{4}$/) && value.to_i.between?(2010, 2020) },
  eyr: ->(value) { value&.match(/^\d{4}$/) && value.to_i.between?(2020, 2030) },
  hgt: ->(value) {
    match = value&.match /(\d+)(.+)/
    match && (match[2] == 'cm' ? match[1].to_i.between?(150, 193) : match[1].to_i.between?(59, 76))
  },
  hcl: ->(value) { value&.match /^#[0-9a-f]{6}$/ },
  ecl: ->(value) { ['amb', 'blu', 'brn', 'gry', 'grn', 'hzl', 'oth'].include? value },
  pid: ->(value) { value&.match /^\d{9}$/ }
}
puts "2) #{passwords.select { |passport|
  passport.rules = rules
  passport.valid?
}.count}"
