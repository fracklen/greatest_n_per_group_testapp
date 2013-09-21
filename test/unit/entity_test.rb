require 'test_helper'

class EntityTest < ActiveSupport::TestCase
  test "greatest n per query works" do
    [1,2,3].each do |group_id|
      [10,20,30].each do |value|
        Entity.create(:group_id => group_id, :value => value)
      end
    end
    
    entities = Entity.greatest_n_per_group
    assert entities.map(&:group_id).sort == [1,2,3], "Group IDs are present #{entities.map(&:group_id)}"
    assert entities.map(&:value) == [30,30,30], "Values are as expected #{entities.map(&:value)}"    
  end
end
