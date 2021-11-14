# == Schema Information
#
# Table name: reviews
#
#  id                 :bigint           not null, primary key
#  body               :text
#  focused_rating     :integer
#  headline           :string
#  honesty_rating     :integer
#  pictures           :json
#  reliability_rating :integer
#  skill_rating       :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  job_id             :bigint
#
# Indexes
#
#  index_reviews_on_job_id  (job_id)
#
# Foreign Keys
#
#  fk_rails_...  (job_id => jobs.id)
#
require "test_helper"

class ReviewTest < ActiveSupport::TestCase

  test "skill rating should be an integer value" do
    review_one = reviews(:one)
    review_one.skill_rating = 3.5
    assert_not review_one.valid?
  end

  test "honesty rating should be an integer value" do
    review_one = reviews(:one)
    review_one.honesty_rating = 3.4
    assert_not review_one.valid?
  end

  test "reliability rating should be an integer value" do
    review_one = reviews(:one)
    review_one.reliability_rating = 2.3
    assert_not review_one.valid?
  end

  test "focused rating should be an integer value" do
    review_one = reviews(:one)
    review_one.focused_rating = 2.3
    assert_not review_one.valid?
  end

  test "body cannot be blank" do
    review_one = reviews(:one)
    review_one.body = ""
    assert_not review_one.valid?
  end

  test "headline cannot be blank" do
    review_one = reviews(:one)
    review_one.headline = ""
    assert_not review_one.valid?
  end
  
end
