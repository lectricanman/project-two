class AddColumnToReplies < ActiveRecord::Migration
  def change
    add_reference :replies, :post, index: true
  end
end
