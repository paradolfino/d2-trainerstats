module ApplicationHelper
    def search_compare(value, string)
        if value.downcase.include? string.downcase
           return true
        end
    end
end
