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
#  worker_id   :bigint
#
# Indexes
#
#  index_jobs_on_customer_id  (customer_id)
#  index_jobs_on_worker_id    (worker_id)
#
# Foreign Keys
#
#  fk_rails_...  (customer_id => customers.id)
#  fk_rails_...  (worker_id => workers.id)
#
class Job < ApplicationRecord
    belongs_to(
        :customer,
        class_name: 'Customer',
        foreign_key: 'customer_id',
        inverse_of: :jobs
      )

      belongs_to(
        :worker,
        class_name: 'Worker',
        foreign_key: 'worker_id',
        inverse_of: :jobs
      )

      has_one(
        :reviews,
        class_name: 'Review',
        foreign_key: 'job_id',
        inverse_of: :job,
        dependent: :destroy
      )

      belongs_to(
        :worker,
        class_name: 'Worker',
        foreign_key: 'worker_id',
        inverse_of: :jobs
      )

      def customer_name
        customer.name
      end

      def worker_name
        worker.name
      end

      def worker_id
        worker.id
      end

      def customer_email
        customer.email
      end

      def customer_first_name
        customer.first_name
      end

      def worker_first_name
        worker.first_name
      end
      
      def average_rating
        if reviews == nil
          return 0.0
        else
          reviews.average_rating
        end
      end
end
