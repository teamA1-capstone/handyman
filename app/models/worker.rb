# == Schema Information
#
# Table name: workers
#
#  id                     :bigint           not null, primary key
#  city                   :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  invisibility           :integer
#  last_name              :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  specialty              :string
#  state                  :string
#  street_address         :string
#  zip_code               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_workers_on_email                 (email) UNIQUE
#  index_workers_on_reset_password_token  (reset_password_token) UNIQUE
#
class Worker < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many(
    :jobs,
    class_name: 'Job',
    foreign_key: 'worker_id',
    inverse_of: :worker,
    dependent: :destroy
  )

end
