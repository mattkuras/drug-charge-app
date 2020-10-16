class Table

    attr_reader :table 

    def initialize(table)
        @table = table 
    end

    def possession
        content = find_content('Possession</td>')
        Table.clean_content(content)
    end
    
    def sale
        content = find_content('Sale') 
        Table.clean_content(content)
    end

    def trafficking
        content = find_content('Trafficking')
        Table.clean_content(content)
    end

    
    

    def find_content(selector)
        selector_location = table.index(selector)
        start_of_content = table[selector_location..-1].index('<td>') + selector_location + 4
        finish_of_content = table[start_of_content..-1].index('</tr>') + (start_of_content - 1)
        content = table[start_of_content..finish_of_content]
        replacements = {
            '<li>' => '',
            '</li>' => '',
            '<ul>' => '',
            '</ul>' => '',
            '<a' => ''
        }
        content.gsub!(/<li>|<\/li>|<ul>|<\/a>|<\/ul>|<\/td>/) { |match| replacements[match] }
    end

    def self.strip_anchor_content(content)
        if content.index('<a').nil?
            return content 
        else
            start = content.index('<a ')
            finish = content[start..-1].index('>') + start
            finished_content = content.sub(content[start..finish], '')
        end 
    end

    def self.clean_content(content)
        
        new_content = Table.strip_anchor_content(content)
        new_content.strip!
    end

end
