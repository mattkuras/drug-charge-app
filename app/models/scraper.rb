require 'open-uri'

class Scraper
    def self.run(state = "new-jersey", drug = "marijuana")

        url = "https://statelaws.findlaw.com/#{state}-law/#{state}-#{drug}-laws.html"
        
        # open the url into a doc
        # parse the html
        # find each table
        # get the code section, possession, sale, and trafficking data from table
        # store the tables into an array of objects 

        doc = open(url)        
        # byebug
        html = doc.read
        table = find_table(html)
        Table.new(table)
        # puts "*" * 30 
        # puts t.possession
        # puts "*" * 30 
        # puts t.sale
    end

    def self.find_table(html)
        start = html.index('<tbody>')
        ending = html.index('</tbody>')
        table = html[start..ending]
        replacements = {
            '<li>' => '',
            '</li>' => '',
            '<ul>' => '',
            '</ul>' => '',
            '<a' => '',
            '<p>' => '',
            '</p>' => '',
            '<br />' => '',
            '<u>' => '',
            '</u>' => ''
        }
        Table.clean_content(table)

        table.gsub!(/<li>|<\/li>|<\/p>|<p>|<ul>|<\/a>|<\/ul>|<\/td>|<br \/>|<b>|<\/b>|<i>|<\/i>|<sup>|<\/sup>|<u>|<\/u>/) { |match| replacements[match] }

    end

end
