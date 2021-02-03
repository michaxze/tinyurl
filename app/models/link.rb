class Link < ApplicationRecord
  has_many :visits, dependent: :destroy
  validates_presence_of :original_url
  validates_uniqueness_of :original_url, :code

  before_save :assign_code

  HOSTNAME = "http://0424c6f82741.ngrok.io"

  def short_url
    [HOSTNAME, code].join('/')
  end

  private

  def assign_code
    self.code = LinkService.new.generate_code
    errors.add(:base, "Unable to generate short url.") if self.code.nil?
  end
end
