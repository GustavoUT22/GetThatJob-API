class AddRefFollowableToFollow < ActiveRecord::Migration[7.0]
  def change
    add_reference :follows, :followable, polymorphic: true, null: false
  end
end
