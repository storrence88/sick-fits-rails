# == Schema Information
#
# Table name: products
#
#  id          :bigint(8)        not null, primary key
#  description :text             not null
#  name        :string           not null
#  price       :integer          not null
#  status      :string           default("DRAFT"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint(8)        not null
#
# Indexes
#
#  index_products_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Product < ApplicationRecord
  belongs_to :user

  validates :name, :description, :price, :status, presence: true
end
