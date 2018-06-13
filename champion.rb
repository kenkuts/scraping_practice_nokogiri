require_relative "noko.rb"
require "nokogiri"
require "open-uri"

class Champion
  attr_accessor :name, :description, :image_url
  @@champion = []

  def initialize
    @@champion << self
  end

  def self.all
    @@champion
  end

  def self.reset_all
    self.all.clear
  end

  def self.print_champions
    @@champion.each do |champ|
      puts "Name: #{champ.name}"
      puts "Description: #{champ.description}"
      puts "Image-Link: #{champ.image_url}"
      puts "-----------------------------"
    end
  end

end

ScraperClass.get_data
Champion.print_champions
