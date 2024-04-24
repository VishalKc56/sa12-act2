require 'httparty'
require 'json'

username = 'VishalKc56'  

def fetch_repos(username)
  response = HTTParty.get("https://api.github.com/users/#{username}/repos")
  JSON.parse(response.body)
end

def find_most_starred_repo(repos)
  repos.max_by { |repo| repo['stargazers_count'] }
end

repos = fetch_repos(username)
most_starred = find_most_starred_repo(repos)

if most_starred
    puts "Most Starred Repo: #{most_starred['name']}"
    puts "Description: #{most_starred['description']}"
    puts "Stars: #{most_starred['stargazers_count']}"
    puts "URL: #{most_starred['html_url']}"
  else
    puts "No repositories found or error in fetching data."
end