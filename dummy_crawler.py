import httplib
import base64
import urllib
import json

# CONSUMER_KEY = "587748278082312"
# CONSUMER_SECRET = "653f038ce5648e38a231609066407d86"
# ACCESS_KEY = "your access token"
# ACCESS_SECRET = "your access token secret"
#
# consumer = oauth.Consumer(key=CONSUMER_KEY, secret=CONSUMER_SECRET)
# access_token = oauth.Token(key=ACCESS_KEY, secret=ACCESS_SECRET)
# client = oauth.Client(consumer, access_token)
#
# timeline_endpoint = "https://api.twitter.com/1.1/statuses/home_timeline.json"
# response, data = client.request(timeline_endpoint)
#
# print(str(response))
#
# tweets = json.loads(data)
CLIENT_ID = "587748278082312"
CLIENT_SECRET = "653f038ce5648e38a231609066407d86"
TOKEN_URL = "https://graph.facebook.com/v2.6/oauth/access_token"

conn = httplib.HTTPSConnection("graph.facebook.com")

params = { "grant_type": "client_credentials" }


conn.request("POST", requestUrl, headers=headersMap)

params = {
    "grant_type": "client_credentials"
}

client = CLIENT_ID
client_secret = CLIENT_SECRET
