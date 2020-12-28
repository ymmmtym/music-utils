# music-utils

This repository contains music utils for personal use.

```txt
feature/       *-*
              /   \
main         *-----*---*--
              \       /
tracklist/     *-----*
                \   /
ci/tracklist/    *-*
```

<https://ymmmtym.com/music-utils/>

## Requirements

- docker >= 19.03.5
- docker-compose >= 1.24.1

## Usage

### Update index.html

Work on tracklist branch.  
Add tracklist exported from Traktor.

```bash
git checkout -b tracklist/${branch}
mv ${tracklist} ./tracklists/
git push origin tracklist/${branch}

# ex)
# git checkout -b tracklist/techno01
# mv mix-techno01.html ./tracklists/
# git push origin tracklist/techno01
```

Checkout ci branch created by Github Actions.  
Merge to tracklist branch.

```bash
hub ci-status
# success

git checkout -b ci/tracklist/${branch} origin/ci/tracklist/${branch}
gh pr merge
```

Merge tracklist branch to main.

```bash
git checkout tracklist/${branch}
gh pr create
gh pr merge
```

### Convert filename to songtitle for audio files (e.g. mp3)

```bash
mkdir input output

# Move album dir including mp3 files to input dir

bash ./scripts/convert_filename2songtitle.sh ./input ./output
```
