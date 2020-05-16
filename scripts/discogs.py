import discogs_client
import os


user_token = os.environ['DISCOGS_USER_TOKEN']
user_name = os.environ['DISCOGS_USER_NAME']

d = discogs_client.Client('ExampleApplication/0.1', user_token=user_token)
u = d.user(user_name)

results = d.search('Madlib', type='release')
artist = results[0].artists[0]

def own(release_id=None):
    index = 1
    while True:
        try:
            for release in u.collection_folders[0].releases.page(index):
                if release.id and release.id == release_id:
                    return True
                index += 1
        except:
            return False

# wantlistに追加
# if not own_my_collection(release.id):
#     u.wantlist.add(release.id)

if __name__ == '__main__':
    print(own(1245161))
