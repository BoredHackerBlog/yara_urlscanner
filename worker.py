from huey import SqliteHuey
import requests
import yara
import apprise
import warnings
warnings.filterwarnings("ignore")

rules = yara.compile("rules.yar")

huey = SqliteHuey(filename='tasks.db')

def yara_scan(html_content):
    yara_matches = rules.match(data=html_content)
    if len(yara_matches) > 0:
        return str(yara_matches)
    else:
        return False

def notify(url, scan_results):
    url_clean = url.replace(".","[.]")
    apobj = apprise.Apprise()
    #UNCOMMENT AND MODIFY THIS see: https://github.com/caronc/apprise#supported-notifications
    #apobj.add('') #CHANGEME
    apobj.notify(body=f"Results: { scan_results } for URL { url_clean }", title="Site Scan Alert")

    #add other stuff you wanna do here, like logging

@huey.task()
def start_scan(url):
    try:
        html_content = requests.get(url, timeout=2, verify=False).text #CHANGEME change the time out if you want
        scan_results = yara_scan(html_content)
        if scan_results is not False:
            notify(url, scan_results)
    except:
        return False