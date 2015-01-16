module StubParams

  def params_with_offers
    {
      appid: 157,
      apple_idfa: '2E7CE4B3-F68A-44D9-A923-F4E48D92B31E',
      apple_idfa_tracking_enabled: true,
      format: 'json',
      ip: '109.235.143.113',
      locale: 'de',
      offer_types: 112,
      os_version: '6.0',
      page: 1,
      ps_time: Time.now.to_i,
      pub0: 'campaign2',
      timestamp: Time.now.to_i,
      uid: 'player1'
    }
  end

  def params_no_offers
    {
      appid: 157,
      apple_idfa: '2E7CE4B3-F68A-44D9-A923-F4E48D92B31E',
      apple_idfa_tracking_enabled: true,
      device_id: '2b6f0cc904d137be2e1730235f5664094b831186',
      format: 'json',
      ip: '109.235.143.113',
      locale: 'de',
      offer_types: 112,
      os_version: '6.0',
      page: 1,
      ps_time: Time.now.to_i,
      pub0: 'campaign2',
      timestamp: Time.now.to_i,
      uid: 'player1'
    }
  end

  def params_invalid_uid
    {
      appid: 157,
      apple_idfa: '2E7CE4B3-F68A-44D9-A923-F4E48D92B31E',
      apple_idfa_tracking_enabled: true,
      format: 'json',
      ip: '109.235.143.113',
      locale: 'de',
      offer_types: 112,
      os_version: '6.0',
      page: 1,
      ps_time: Time.now.to_i,
      pub0: 'campaign2',
      timestamp: Time.now.to_i,
      uid: ''
    }
  end

  def params_invalid_appid
    {
      appid: '',
      apple_idfa: '2E7CE4B3-F68A-44D9-A923-F4E48D92B31E',
      apple_idfa_tracking_enabled: true,
      format: 'json',
      ip: '109.235.143.113',
      locale: 'de',
      offer_types: 112,
      os_version: '6.0',
      page: 1,
      ps_time: Time.now.to_i,
      pub0: 'campaign2',
      timestamp: Time.now.to_i,
      uid: 'player1'
    }
  end

  def params_invalid_timestamp
    {
      appid: 157,
      apple_idfa: '2E7CE4B3-F68A-44D9-A923-F4E48D92B31E',
      apple_idfa_tracking_enabled: true,
      format: 'json',
      ip: '109.235.143.113',
      locale: 'de',
      offer_types: 112,
      os_version: '6.0',
      page: 1,
      ps_time: Time.now.to_i,
      pub0: 'campaign2',
      timestamp: '',
      uid: 'player1'
    }
  end
end
