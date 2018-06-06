module ApplicationHelper
    def search_compare(value, string)
        return true if value.downcase.include? string.downcase
    end
end
