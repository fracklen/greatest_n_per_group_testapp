class Entity < ActiveRecord::Base
  attr_accessible :group_id, :value

  class << self
    def greatest_n_per_group
      sub_query = "SELECT *, rank() OVER (PARTITION BY group_id ORDER BY value DESC) AS rank_column FROM #{table_name}"
      query = "SELECT * FROM (#{sub_query}) as sub_query WHERE sub_query.rank_column = 1"
      find_by_sql(query)
    end
  end
end
