require 'nokogiri'
require 'open-uri'
require 'erb'

namespace :import do

  task :countries do

    # Get the locale identifiers
    doc = Nokogiri::HTML(open('http://www.unicode.org/cldr/charts/latest/summary/root.html'))
    locales = []
    doc.xpath('/html/body/div/p[@style="margin-left:5em"]').each do |l|
      locales << l.content.scan(/\[(.*?)\]/)
    end
    locales.flatten!

    # Get all the country translations for each one of the locales
    locales.each do |l|
      @countries = []
      @locale = l
      doc = Nokogiri::HTML(open("http://www.unicode.org/cldr/charts/latest/summary/#{@locale}.html"))
      doc.xpath('/html/body/div/table[1]/tr/td[3]//text()[contains(., "Territories")]').each do |l|
        node = l.parent.parent
        code = node.children[4].content
        @countries << {code: code, name: node.children[7].content} if code.size < 3
      end
      @countries.sort_by!{|c| c[:code]}

      # Writing translations to a YAML file
      template = File.read(File.join(File.dirname(__FILE__), 'countries.yml.erb'))
      output = File.expand_path(File.join(File.dirname(__FILE__), %W{.. rails locale #{@locale}.yml}))
      File.open(output, 'w+') do |f|
        f.write ERB.new(template).result
      end
      puts "locale [#{@locale}] written into file:#{output}"
    end

  end
end