class LinkService

  def generate_code
    3.times do
      code = SecureRandom.hex(4)
      puts code.inspect
      return code if Link.where(code: code).blank?
    end

    nil
  end

  def viewed(link_id, ip_address)
    Visit.create(ip_address: ip_address, link_id: link_id)
  end
end
