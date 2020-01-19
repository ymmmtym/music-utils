# music-utils
This repository contains music utils for personal use.

https://ymmmtym.github.io/music-utils/

## Requirements

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
./scripts/convert_filename_to_songtitle_for_mp3.sh ${input dir} ${output dir}
```