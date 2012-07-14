require 'hpricot'

module Toto
	class Article < Hash
		include Template

		def link()  self[:link]	end

		def linktitle
			alias :link link
			doc = Hpricot(open(link))
			(doc/"title").inner_text
		end

		def dateUTC
			lambda {|now| now.strftime("%Y-%m-%d") }.call(self[:date])
		end

		def datetime
			lambda {|now| now.strftime("%B %d, %Y") }.call(self[:date])
		end
	end
end