#Attempting to make a webcrawler to download 52 cards from
#www.openclipart.org

#Webcrawler to get cards
#Great tips here:
#http://randomtype.ca/blog/3-tips-ruby-mechanize/
#http://docs.seattlerb.org/mechanize/GUIDE_rdoc.html
#http://stackoverflow.com/questions/9150032/using-mechanize-or-even-nethttp-with-ruby-1-9-returns-opensslsslsslerro

require 'mechanize'
#I can't get past the https without this, need to learn about SSL!
a = Mechanize.new
a.agent.http.verify_mode = OpenSSL::SSL::VERIFY_NONE

page = a.get 'https://openclipart.org/search/?query=ornamental+deck&page=2'
puts "Searching for cards on openclipart website..."

url_list = []
page.links_with(:href => /ornamental-deck/).each do |link|
  url_list << link.href
end
url_list.uniq!

#use this to test only one page
#first_page = a.get url_list[0]

url_list.each do |card_url|
  card_page = a.get card_url
  card_page.links_with(:href => /\/2400px\//).each do |link|
    puts "This is the link to the big image"
    puts link.href
    puts "This is the file name:"
    fullname = link.href.split('/').last
    shortname = fullname.sub('nicubunu_Ornamental_deck_','').downcase
    puts shortname
    download_page = link.click
    puts download_page.uri
    a.get(download_page.uri).save_as "images/cards2/#{shortname}"
  end
end