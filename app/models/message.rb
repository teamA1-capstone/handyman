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
class Message < ApplicationRecord
    belongs_to(
        :sender,
        polymorphic: true,
        foreign_key: 'sender_id'
    )
    
    belongs_to(
        :receiver,
        polymorphic: true,
        foreign_key: 'receiver_id'
      )
end