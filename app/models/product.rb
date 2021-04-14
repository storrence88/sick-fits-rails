# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id          :bigint(8)        not null, primary key
#  description :text             not null
#  name        :string           not null
#  price       :integer          not null
#  status      :string           default("draft"), not null
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
  extend Enumerize

  STATUSES = %i[draft available unavailable].freeze
  enumerize :status, in: STATUSES, default: :draft, predicates: true, scope: :shallow

  belongs_to :user
  has_one_attached :image

  validates :name, :description, :price, :status, presence: true
end
