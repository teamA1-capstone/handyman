# == Schema Information
#
# Table name: messages
#
#  id         :bigint           not null, primary key
#  body       :text
#  subject    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Message < ApplicationRecord
end
