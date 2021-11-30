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
    inverse_of: :worker
  )

  def name
    first_name + " " + last_name
  end

  def average_rating
    result = 0.0
    index = jobs.size()
    
    while index > 0
      result = result + jobs[index-1].average_rating
      index = index - 1
    end
    return result
  end

  def number_of_ratings
    return jobs.size()
  end
  
  def stars
    if(average_rating > 0.8)
      return "5 Stars"
    elsif (average_rating > 0.6)
      return "4 Stars"
    elsif (average_rating > 0.4)
      return "3 Stars"
    elsif (average_rating > 0.2)
      return "2 Stars"
    elsif (average_rating > 0.0)
      return "1 Star"
    else
      return "No Reviews"
    end
  end
end
