module ApplicationHelper
    def search_compare(value, string)
        if value.downcase.include? string.downcase
           @results += 1
           return true
        end
    end
end
