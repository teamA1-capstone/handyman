# == Schema Information
#
# Table name: messages
#
#  id            :bigint           not null, primary key
#  body          :text
#  receiver_type :string
#  sender_type   :string
#  subject       :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  receiver_id   :bigint
#  sender_id     :bigint
#
# Indexes
#
#  index_messages_on_receiver  (receiver_type,receiver_id)
#  index_messages_on_sender    (sender_type,sender_id)
#
require "test_helper"

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
