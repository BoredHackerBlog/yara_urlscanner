# yara_urlscanner
Downloads html code from url and scans with yara and notifies whatever you want

Essentially, I'm using requests to download html content from a url and scanning it with yara.

warning: there is some memory issue with huey worker. not sure what it is but i'd recommend setting up the docker container to auto-restart...

# Design
Flask app takes in a URL request, queues a task with huey, huey task downloads html content with requests, yara scans the content, if yara matches are found then apprise can be used for notification or you can log the info. Code is easy to modify.

The code and design isn't the greatest but it's good enough for me. I spent less than a day on this.

# Setup/Running:
install docker, git clone the repo, find #CHANGEME in various files and change the things you need, build the container with `docker build -t yara_urlscanner .` and run it like this `docker run -it --rm -p 5000:5000 yara_urlscanner`

Modify the docker command as needed.

# Using:
There is no webui. You can use curl, python, etc...

```
curl --request POST \
  --url http://YOUR_HOST:5000/scan \
  --header 'Content-Type: application/x-www-form-urlencoded' \
  --data url=https://example.com


import requests
url = "http://YOUR_HOST:5000/scan"
payload = "url=https://example.com"
headers = {"Content-Type": "application/x-www-form-urlencoded"}
response = requests.request("POST", url, data=payload, headers=headers)
print(response.text)

# I think this should work too.
import requests
def screenshot(domain):
    data = {'url': "https://example.com"}
    requests.post('http://YOUR_HOST:8888/scan', data=data)
```

Check this out this related content:
- https://github.com/BoredHackerBlog/certstream_to_littleshot
- https://www.boredhackerblog.info/2022/07/screenshottingscanning-domains-from.html
- https://github.com/BoredHackerBlog/littleshot
