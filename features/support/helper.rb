def send_with_report(res_type, url, body = nil, headers = nil)
  res = case res_type
        when 'GET' then RestClient.get(url, headers)
        when 'PUT' then RestClient.put(url, body, headers)
        when 'PATCH' then RestClient.patch(url, body, headers)
        when 'POST' then RestClient.post(url, body, headers)
        when 'DELETE' then RestClient.delete(url, headers)
        end
  @failed_req_id = res.headers[:x_request_id]
  res
rescue RestClient::Exception => e
  @err_res = e.response
  raise("Error code: #{e.response.code} #{res_type} #{url}\nRequest ID: #{@failed_req_id}\nMessage:#{@err_res}")
end

def parse_and_report(res_type, url, body = nil, headers = nil)
  res = send_with_report(res_type, url, body, headers)
  JSON.parse(res, symbolize_names: true)
end
