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
class Review < ApplicationRecord
    #Tells rails to use this uploader for this model.
    mount_uploaders :pictures, PictureUploader

    # Make sure all the attributes have content assigned (not including the pictures attribute).
    validates :headline, :body, :focused_rating, :honesty_rating, :reliability_rating, :skill_rating, presence: true

    #only allows integer values to be assigned to these rating attributes
    validates :focused_rating, :skill_rating, :honesty_rating, :reliability_rating, numericality: { only_integer: true }

    belongs_to(
        :job,
        class_name: 'Job',
        foreign_key: 'job_id',
        inverse_of: :reviews
    )

    def customer_name
        job.customer_name
    end

    def customer_first_name
        job.customer_first_name
    end

    def customer_email
        job.customer_email
    end
end
