module ApplicationHelper
    def search_compare(query, string)
        return true if query.include? string
    end
end
