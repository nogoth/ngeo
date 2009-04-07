require 'hpricot'

root = 'http://photography.nationalgeographic.com'

#pear = Hpricot(File.open("pod.html").readlines.join)
url = STDIN.readlines.join
pear = Hpricot(`curl --silent #{url} `)


p = pear.search("img").select do |img|
  img["src"] =~ /POD/
end

STDERR.puts root+p[0]["src"].gsub(/ga/,"xl").to_s

p = pear.search("a[@class = 'previous']")
puts root+p[0]["href"].to_s
