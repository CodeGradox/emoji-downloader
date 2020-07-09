#!/usr/bin/ruby
# encoding: utf-8
# frozen_string_literal: true

require "net/http"
require "uri"

VERSION = 12.1

request = Net::HTTP.get URI("https://unicode.org/Public/emoji/#{VERSION}/emoji-test.txt")

emojis = request.lines
  .reject { |l| l.start_with?(/\s|#/) }
  .map { |l| l.split(/# /)[1].split(/ E\d+\.\d+ /) }
  .map { |data| data.join(" ") }
  .join

File.open("emoji", "w") do |file|
  file.write emojis
end
