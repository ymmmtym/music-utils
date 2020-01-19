# music-utils
This repository contains music utils for personal use.

https://ymmmtym.github.io/music-utils/

## Requirements
- docker >= 19.03.5
- docker-compose >= 1.24.1

## Usage

### Update index.html

work on master branch

#### 1. add tracklist exported Traktor

```
mv ${tracklist} ./tracklists/

# ex) mv mix-techno01.html ./tracklists/
```

#### 2. Push master branch
#### 3. Create index.html by Github Actions

### Convert filename to songtitle for audio files (e.g. mp3)

```
mkdir input output

# Input your mp3 files to input dir

docker-compose exec music-container "./scripts/convert_filename2songtitle.sh ./input ./output"
```