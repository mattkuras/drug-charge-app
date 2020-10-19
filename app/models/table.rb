class Table

    attr_reader :table 

    def initialize(table)
        @table = table 
    end

    def possession
        content = find_content('Possession') 
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
        if table.index(selector) == nil 
            content = 'cannot find content'
        else
            selector_location = table.index(selector)
            start_of_content = table[selector_location..-1].index('>') + selector_location + 1
            finish_of_content = table[start_of_content..-1].index('</tr>') + (start_of_content - 1)
            content = table[start_of_content..finish_of_content]
        end
        content 
    end

    def self.strip_anchor_content(content)
        a_tag = true 
        
        while a_tag == true do 

        if content.index('<a').nil?
            a_tag = false 
            return content 
        else
            start = content.index('<a ')
            finish = content[start..-1].index('>') + start
            finished_content = content.sub!(content[start..finish], '')
        end
        end 
    end

    def self.clean_content(content)
        
        new_content = strip_anchor_content(content)
        new_content.strip!
    end

end

# exceptions: alabama.cocaine.sale, kentucky.cocaine.sale 
