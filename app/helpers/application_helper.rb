module ApplicationHelper
    def sanitize_search(query, string)
        
    end
    def search_compare(query, string)
        return true if query.include? string
    end
end
