class FilesController < ApplicationController

    def name 
        require 'rubygems'
        require 'rest-client'

        url = "https://exomo.grafana.net/api/datasources"

        @response_get = RestClient::Request.execute(:method => 'get', :url => url, :headers => {:Authorization => 'Bearer eyJrIjoiNDdETDVnZ3p0STJxaktyN1VZY2F4c3MyWmFtNTJrNVgiLCJuIjoiZXhvbW8iLCJpZCI6MX0='})
        
        response = RestClient::Request.new({
            method: :post,
            url: url, 
            payload: {type: 'marcusolsson-csv-datasource',
                    name:'Marc_Coffinet_RoR',
                    url: 'https://dl.dropbox.com/s/27ff5w2yuidt3fi/0x341513238FCF_2021-05-09_19-43-55.csv?row=1', 
                    access: 'proxy', 
                    basicAuth: false},
            headers: {Authorization:'Bearer eyJrIjoiNDdETDVnZ3p0STJxaktyN1VZY2F4c3MyWmFtNTJrNVgiLCJuIjoiZXhvbW8iLCJpZCI6MX0=',
                    accept: JSON,
                    content_type: :JSON}
            }).execute do |response, request, result|

            case response.code
            when 400
                [ :error, JSON.parse(response.to_str) ]
                @return_request = "error = 400"
            when 200
                [ :success, JSON.parse(response.to_str) ]
                @return_request = "success = 200"
            else
                ["unknow error, find it !", response.code]
            end
        end

        @response_post = response

        # Utilisation de la gem RestClient pour une requete "get" (demande d'information)

            #$auth = 'Bearer eyJrIjoiNDdETDVnZ3p0STJxaktyN1VZY2F4c3MyWmFtNTJrNVgiLCJuIjoiZXhvbW8iLCJpZCI6MX0='
            #@resource = RestClient::Resource.new( $url )
            #@response = @resource.get( :Authorization => $auth )
    
    end


end
