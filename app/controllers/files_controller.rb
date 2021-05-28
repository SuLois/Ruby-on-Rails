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

        @response_get = RestClient::Request.execute(:method => 'get', :url => url, :headers => {:Authorization => 'Bearer eyJrIjoiNDdETDVnZ3p0STJxaktyN1VZY2F4c3MyWmFtNTJrNVgiLCJuIjoiZXhvbW8iLCJpZCI6MX0='})
        

        response_post = RestClient::Request.new({
            method: :post,
            url: url, 
            payload: {type: 'marcusolsson-csv-datasource',
                    name:'rubyDS',
                    url: 'https://dl.dropbox.com/s/mw3z35tlebe456a/0x341513238FCF_2021-01-27_14-26-11.csv?row=1', 
                    access: 'proxy', 
                    basicAuth: false},
            headers: {Authorization:'Bearer eyJrIjoiNDdETDVnZ3p0STJxaktyN1VZY2F4c3MyWmFtNTJrNVgiLCJuIjoiZXhvbW8iLCJpZCI6MX0=',
                    accept: JSON,
                    content_type: :JSON}
            }).execute do |response_post, request, result|

            case response_post.code
            when 400
                [ :error, JSON.parse(response_post.to_str) ]
                @return_request = "error = 400"
            when 200
                [ :success, JSON.parse(response_post.to_str) ]
                @return_request = "success = 200"
            else
                ["unknow error, find it !", response_post.code]
            end
        end

        @response = response_post
        #$auth = 'Bearer eyJrIjoiNDdETDVnZ3p0STJxaktyN1VZY2F4c3MyWmFtNTJrNVgiLCJuIjoiZXhvbW8iLCJpZCI6MX0='
        
        
        #@resource = RestClient::Resource.new( $url )
        #@response = @resource.get( :Authorization => $auth )
    
    end


end
