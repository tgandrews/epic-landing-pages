class LandingPage < ActiveRecord::Base
  validates :url, presence: true,
          uniqueness: { case_sensitive: false },
          format: { with: /\A\w+\.[\w\.]+\Z/, message: 'not a valid URL' }

  before_validation :strip_www

  private
  def strip_www
    if (!self.url.nil? && self.url.start_with? 'www.')
      self.url = self.url[4, self.url.length]
    end
  end
end
