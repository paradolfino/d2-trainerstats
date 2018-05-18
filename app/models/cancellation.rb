class Cancellation < ApplicationRecord
  belongs_to :cancellation_log
  def self.to_csv(options = {})
        items = 0
      CSV.generate(options) do |csv|
        csv << column_names
        all.each do |cancellation|
            items += 1
          csv << cancellation.attributes.values_at(*column_names)
        end
        csv << ["Total Cancellations", items]
      end
    end
end
