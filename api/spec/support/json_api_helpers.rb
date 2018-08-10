module JsonApiHelpers
  def json
    # Expect a valid JSON format
    JSON.parse(response.body)
  end

  def json_data
    # Extract the data content into a variable
    json["data"]
  end
end
