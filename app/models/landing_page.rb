class LandingPage < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'

  validates :owner, presence: true
  validates :url, presence: true,
          uniqueness: { case_sensitive: false },
          format: { with: /\A\w+\.[\w\.]+\Z/, message: 'not a valid URL' }

  before_validation :strip_www

  accepts_nested_attributes_for :owner

  private
  def strip_www
    if (!self.url.nil? && self.url.start_with?('www.'))
      self.url = self.url[4, self.url.length]
    end
  end
end
