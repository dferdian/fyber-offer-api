module ApplicationHelper

  def parse_json_content(content, key)
    JSON.parse(content)[key]
  end
end
