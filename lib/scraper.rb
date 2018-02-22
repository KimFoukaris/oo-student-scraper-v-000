require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    html = File.read(index_url)
    learnco = Nokogiri::HTML(html)
    array = []
    learnco.css("div.student-card").each do |student|
      array << {
      :name => student.css("h4.student-name").text,
      :location => student.css("p.student-location").text,
      :profile_url => student.css("a").attribute("href").value
      }
    end
    array
  end

  def self.scrape_profile_page(profile_url)
    html = File.read(profile_url)
    learnco = Nokogiri::HTML(html)
    student = {}
    links = []
    learnco.css("div.social-icon-container a").each do |link|
      links << link
    end
    binding.pry
    #  link_text = learnco.css("div.social-icon-container a").attribute("href").value
    #  case
    #  when link_text.include?("twitter")
    #    t_link = learnco.css("div.social-icon-container a").attribute("href").value
    #  when link_text.include?("linkedin")
    #    l_link = learnco.css("div.social-icon-container a").attribute("href").value
    #  when link_text.include?("github")
    #    g_link = learnco.css("div.social-icon-container a").attribute("href").value
    #  else
    #    b_link = learnco.css("div.social-icon-container a").attribute("href").value
  #    end
    #  binding.pry
  #  end
#binding.pry
  #student = {
  #    :profile_quote => learnco.css("div.vitals-text-container div").text,
  #    :bio => learnco.css("div.description-holder p").text,
  #    :twitter => t_link, #learnco.css("div.social-icon-container a")[0].attribute("href").value,
  #    :linkedin => l_link, #learnco.css("div.social-icon-container a")[1].attribute("href").value,
  #    :github => g_link, #learnco.css("div.social-icon-container a")[2].attribute("href").value,
  #    :blog => b_link #learnco.css("div.social-icon-container a")[3].attribute("href").value
  #  }

    student = {
      :profile_quote => learnco.css("div.vitals-text-container div").text,
      :bio => learnco.css("div.description-holder p").text,
      :twitter => learnco.css("div.social-icon-container a")[0].attribute("href").value,
      :linkedin => learnco.css("div.social-icon-container a")[1].attribute("href").value,
      :github => learnco.css("div.social-icon-container a")[2].attribute("href").value,
      :blog => learnco.css("div.social-icon-container a")[3].attribute("href").value
    }

  end

end
