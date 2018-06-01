module ApplicationHelper
    def search_compare(query, string)
        return true if query.downcase.include? string.downcase
    end
end
