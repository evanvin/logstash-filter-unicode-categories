# encoding: utf-8
require "logstash/filters/base"
require "logstash/namespace"
require "unicode/categories"

class LogStash::Filters::UnicodeCat < LogStash::Filters::Base

  # filter {
  #   unicode-cat {
  #     data => "My String"
  #   }
  # }
  #
  config_name "unicode-cat"

  config :data, :validate => :string, :default => ""


  public
  def register
    # Add instance variables
  end # def register

  public
  def filter(event)

    if @data
      cats = Unicode::Categories.categories(@data)
      event.set("unicode-categories", cats)
      @logger.debug? && @logger.debug("Categories for #{@data} are: #{cats}")
    end

    filter_matched(event)
  end
end
