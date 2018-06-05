module ApplicationHelper
    def sanitize_search(query, string)
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
        return true if query.include? string
    end
end
