class FilesController < ApplicationController

    def name 
        require 'rubygems'
        require 'rest-client'

        require 'net/http'
        url = "https://exomo.grafana.net/api/datasources"

        #uri = URI(url)
        #req = Net::HTTP::Get.new(uri)
        #req['Authorization'] = "Bearer eyJrIjoiNDdETDVnZ3p0STJxaktyN1VZY2F4c3MyWmFtNTJrNVgiLCJuIjoiZXhvbW8iLCJpZCI6MX0="

        #res = Net::HTTP.start(uri.hostname, uri.port) {|http|
        #   http.request(req)
        #}

        #@body = res.body

        @response = RestClient::Request.execute(:method => 'get', :url => url, :headers => {:Authorization => 'Bearer eyJrIjoiNDdETDVnZ3p0STJxaktyN1VZY2F4c3MyWmFtNTJrNVgiLCJuIjoiZXhvbW8iLCJpZCI6MX0='})
        #$auth = 'Bearer eyJrIjoiNDdETDVnZ3p0STJxaktyN1VZY2F4c3MyWmFtNTJrNVgiLCJuIjoiZXhvbW8iLCJpZCI6MX0='
        
        
        #@resource = RestClient::Resource.new( $url )
        #@response = @resource.get( :Authorization => $auth )
    
    end


end
