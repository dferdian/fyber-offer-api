class SitesController < ApplicationController

  def index; end

  def send_request
    mobile_offer = MobileOfferService.new(compose_params)
    @content_response = mobile_offer.get_content
    @signature_response = mobile_offer.signature_response
    @generated_response_hashkey = mobile_offer.generated_response_hashkey
  end

  private

  def compose_params
    ## default parameters using params as mentioned on the challenge document or using defaut value as mentioned in API doc
    ## http://developer.fyber.com/content/ios/offer-wall/offer-api/

    {
      appid: params[:appid] || 157,
      apple_idfa: params[:apple_idfa] || '2E7CE4B3-F68A-44D9-A923-F4E48D92B31E',
      apple_idfa_tracking_enabled: params[:apple_idfa_tracking_enabled] || true,
      ## using device_id returned no data, so just set default value to empty string as default value
      device_id: params[:device_id] || '', # '2b6f0cc904d137be2e1730235f5664094b831186',
      format: params[:format] || 'json',
      ip: params[:ip] || '109.235.143.113',
      locale: params[:locale] || 'de',
      offer_types: params[:offer_types] || 112,
      os_version: params[:os_version] || '6.0',
      page: params[:page],
      ps_time: params[:ps_time] || Time.now.to_i,
      pub0: params[:pub0],
      timestamp: params[:timestamp] || Time.now.to_i,
      uid: params[:uid]
    }
  end
end
