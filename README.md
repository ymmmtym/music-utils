# music-utils

This repository contains music utils for personal use.

```txt
feature/       *-*
              /   \
main         *---------*--
              \       /
tracklist/     *-----*
                \   /
ci/tracklist     *-*
```

<https://ymmmtym.com/music-utils/>

## Requirements

- docker >= 19.03.5
- docker-compose >= 1.24.1

## Usage

### Update index.html

work on branch without main

#### 1. add tracklist exported Traktor

```bash
mv ${tracklist} ./tracklists/

# ex) mv mix-techno01.html ./tracklists/
```

#### 2. Push branch

#### 3. Create PR with index.html by Github Actions

#### 4. Merge

### Convert filename to songtitle for audio files (e.g. mp3)

```bash
mkdir input output

# Move album dir including mp3 files to input dir

bash ./scripts/convert_filename2songtitle.sh ./input ./output
```
