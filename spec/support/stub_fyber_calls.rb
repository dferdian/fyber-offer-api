module StubFyberCalls

  def stub_all
    stub_with_data
    stub_without_data
    stub_with_uid_error
    stub_with_appid_error
    stub_with_timestamp_error
  end

  def stub_with_data
    content = File.read(Rails.root.join('spec/support/fyber_stubs/mobile_offer_with_data.txt'))
    stub_with_raw_content(content, {
      appid: '157',
      apple_idfa: '2E7CE4B3-F68A-44D9-A923-F4E48D92B31E',
      apple_idfa_tracking_enabled: 'true',
      format: 'json',
      ip: '109.235.143.113',
      locale: 'de',
      offer_types: '112',
      os_version: '6.0',
      page: '1',
      ps_time: "#{Time.now.to_i}",
      pub0: 'campaign2',
      timestamp: "#{Time.now.to_i}",
      uid: 'player1'
    })
  end

  def stub_without_data
    content = File.read(Rails.root.join('spec/support/fyber_stubs/mobile_offer_without_data.txt'))
    stub_with_raw_content(content, {
      appid: '157',
      apple_idfa: '2E7CE4B3-F68A-44D9-A923-F4E48D92B31E',
      apple_idfa_tracking_enabled: 'true',
      device_id: '2b6f0cc904d137be2e1730235f5664094b831186',
      format: 'json',
      ip: '109.235.143.113',
      locale: 'de',
      offer_types: '112',
      os_version: '6.0',
      page: '1',
      ps_time: "#{Time.now.to_i}",
      pub0: 'campaign2',
      timestamp: "#{Time.now.to_i}",
      uid: 'player1'
    })
  end

  def stub_with_uid_error
    content = File.read(Rails.root.join('spec/support/fyber_stubs/mobile_offer_with_uid_error.txt'))
    stub_with_raw_content(content, {
      appid: '157',
      apple_idfa: '2E7CE4B3-F68A-44D9-A923-F4E48D92B31E',
      apple_idfa_tracking_enabled: 'true',
      format: 'json',
      ip: '109.235.143.113',
      locale: 'de',
      offer_types: '112',
      os_version: '6.0',
      page: '1',
      ps_time: "#{Time.now.to_i}",
      pub0: 'campaign2',
      timestamp: "#{Time.now.to_i}",
      uid: ''
    })
  end

  def stub_with_appid_error
    content = File.read(Rails.root.join('spec/support/fyber_stubs/mobile_offer_with_appid_error.txt'))
    stub_with_raw_content(content, {
      appid: '',
      apple_idfa: '2E7CE4B3-F68A-44D9-A923-F4E48D92B31E',
      apple_idfa_tracking_enabled: 'true',
      format: 'json',
      ip: '109.235.143.113',
      locale: 'de',
      offer_types: '112',
      os_version: '6.0',
      page: '1',
      ps_time: "#{Time.now.to_i}",
      pub0: 'campaign2',
      timestamp: "#{Time.now.to_i}",
      uid: 'player1'
    })
  end

  def stub_with_timestamp_error
    content = File.read(Rails.root.join('spec/support/fyber_stubs/mobile_offer_with_timestamp_error.txt'))
    stub_with_raw_content(content, {
      appid: '157',
      apple_idfa: '2E7CE4B3-F68A-44D9-A923-F4E48D92B31E',
      apple_idfa_tracking_enabled: 'true',
      format: 'json',
      ip: '109.235.143.113',
      locale: 'de',
      offer_types: '112',
      os_version: '6.0',
      page: '1',
      ps_time: "#{Time.now.to_i}",
      pub0: 'campaign2',
      timestamp: '',
      uid: 'player1'
    })
  end

  private

  def stub_with_raw_content(content, match_params)
    stub_request(:get, "http://api.sponsorpay.com/feed/v1/offers.json").
      with(
        headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Host'=>'api.sponsorpay.com', 'User-Agent'=>'Ruby'},
        query: hash_including(match_params)).
      to_return(content)
  end
end
