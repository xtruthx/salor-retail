# coding: UTF-8

# Salor -- The innovative Point Of Sales Software for your Retail Store
# Copyright (C) 2012-2013  Red (E) Tools LTD
# 
# See license.txt for the license applying to all files within this software.
class Cue < ActiveRecord::Base
    include SalorBase
    def self.send_all_pending
         req = Net::HTTP::Post.new('/nodes/receive', initheader = {'Content-Type' =>'application/json'})
         Cue.where(:to_send => true, :is_handled => false).all.each do |msg|
           url = URI.parse(msg.url)
           req.body = msg.payload
           SalorBase.log_action self, "Sending: " + req.body.inspect
           request = Net::HTTP.new(url.host, url.port)
           response = request.start {|http| http.request(req) }
           response_parse = JSON.parse(response.body)
           SalorBase.log_action(self,"Received From Node: " + response.body)
           msg.update_attribute :is_handled, true
         end
     end
     def self.receive_all_pending
         Cue.where(:to_receive => true, :is_handled => false).all.each do |msg|
           params = JSON.parse(SalorBase.symbolize_keys(msg.payload))
           node = Node.where(:sku => params[:node][:sku]).first
           node.handle(params)
           msg.update_attribute :is_handled, true
         end
     end

end
