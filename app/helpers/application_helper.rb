module ApplicationHelper
    def sanitize_search(query)
        case query
            when "Member Name"
                "member"
            when "Company Name"
                "company"
            when "Stage"
                query.downcase
            when "Status"
                query.downcase
            else
                "member"
            end
    end
    def search_compare(query, string)
        return true if query.include? string.downcase
    end
end
