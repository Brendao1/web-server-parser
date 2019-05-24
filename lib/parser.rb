# frozen_string_literal: true

class Parser
  attr_reader     :file_to_read
  attr_accessor   :webserverlog_hash, :page_views, :unique_views

  def initialize(file_to_read)
    @file_to_read = file_to_read
    @webserverlog_hash = {}
    @page_views = {}
    @unique_views = {}
  end

  def run
    line_num = 0
    text = File.open(@file_to_read).read
    text.each_line do |line|
      print "#{line_num += 1} #{line}"
      path = line.partition(' ').first
      ip = line.partition(' ').last.chomp
      @webserverlog_hash[path] = [] unless @webserverlog_hash.key?(path)
      @webserverlog_hash[path].push(ip)
    end
    @webserverlog_hash
  end

  def page_visits
    @webserverlog_hash.each do |path, ip|
      @page_views.store(path, ip.count)
    end

    @page_views.sort_by { |_key, value| -value }.each do |page, views|
      puts "#{page} #{views} visits"
    end
    @page_views
  end

  def unique_views
    @webserverlog_hash.each do |path, ip|
      @unique_views.store(path, ip.uniq.count)
    end

    @unique_views.sort_by { |_key, value| -value }.each do |page, views|
      puts "#{page} #{views} unique views"
    end
    @unique_views
  end

  Parser.new(ARGV[0]).run if $PROGRAM_NAME == __FILE__
end
