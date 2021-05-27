class FilesController < ApplicationController

    def name 
        require 'rubygems'
        @body = HTTP.get("http://www.google.fr").body
    end


end
