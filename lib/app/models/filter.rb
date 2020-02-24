module EasyFilter
  class Filter < ActiveRecord::Base
    self.table_name = 'filters'

    validates :sql_query, presence: true, unless: :products? && :events?
  end
end
