import tweepy

# # Step 1 - Authenticate twweter api
consumer_key = 'c1brEaGQNc9zlNxvk5yeeyBWk'
consumer_secret = 'EDqnXIpPgtVTkdDFdigmyU6Rw1hpMVh43RpozCyGRsdjLwtpM4'
access_token = '898281086941241344-CcVXFQuUMw7W4pK5g1vFbdsZcFb0GbQ'
access_token_secret = 'N1EP1DAOPB6vr99NvQUK6mUJotDHKIlwHvmAgS6Cg1k2R'
token = '898281086941241344-CcVXFQuUMw7W4pK5g1vFbdsZcFb0GbQ'
token_secret = 'N1EP1DAOPB6vr99NvQUK6mUJotDHKIlwHvmAgS6Cg1k2R'
auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)
api = tweepy.API(auth)

# Step 3 - Retrieve Tweets
public_tweets = api.search('tarantula', count=100)


# Step 4 Iterate to get suspiciois tweets
for tweet in public_tweets:
    textInside = tweet.text
    buzzwords = ['buy', 'sell', 'take', "exchange", "meetup", "poaching", "hunting", "purchase", "wildlife", "spider",
                 "hunt", "shop", "delivery"]
    if any(s in textInside for s in buzzwords):
        print ("Suspicious Tweet:- ", textInside