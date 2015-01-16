class MobileOfferService

  ENDPOINT = "http://api.sponsorpay.com/feed/v1/offers.json"

  def initialize(endpoint = ENDPOINT, params)
    params = params.merge(hashkey: generate_hashkey(params))
    uri = URI(endpoint)
    uri.query = URI.encode_www_form(params)
    @response = Net::HTTP.get_response(uri)
  end

  def get_content
    @response.body
  end

  def signature_response
    @response["X-Sponsorpay-Response-Signature"]
  end

  def generated_response_hashkey
    generate_response_hashkey(get_content, signature_response)
  end

  private

  def get_sha1(value)
    Digest::SHA1.hexdigest(value)
  end

  def generate_hashkey(data_params)
    concatenate_params = data_params.to_query << '&' << ENV['FYBER_API_KEY']
    get_sha1(concatenate_params)
  end

  def generate_response_hashkey(content_response, signature_response)
    concatenate_response = content_response.to_s + ENV['FYBER_API_KEY']
    get_sha1(concatenate_response)
  end
end