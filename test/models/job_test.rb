# == Schema Information
#
# Table name: jobs
#
#  id          :bigint           not null, primary key
#  completed   :boolean
#  description :string
#  in_progress :boolean
#  name        :string
#  specialty   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :bigint
#
# Indexes
#
#  index_jobs_on_customer_id  (customer_id)
#
# Foreign Keys
#
#  fk_rails_...  (customer_id => customers.id)
#
require "test_helper"

class JobTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
