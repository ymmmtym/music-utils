#!/bin/bash

# Check params and confirm existence of file.
if [ $# -ne 2 ] || [ ! -e $1 ] || [ ! -e $2 ]; then
  echo './convert_filename_to_songtitle_for_mp3.sh ${input dir} ${output dir}'
  exit 1
fi

# set params
input=$1
output=$2

# confirm list
echo "-----Downloads list-----"
ls -R1 "${input}"/

# copy files
echo "-----Please wait for coping the files-----"
created_dir=`date "+%Y%m%d%H%M%S"`
mkdir ${output}/${created_dir}
cp ${input}/*.* ${input}/*/*.* ${input}/*/*/*.* ${output}/${created_dir} 2>/dev/null

# set delimiter
echo "-----enter delimiter:------"
echo "ex). _"
echo "default) (blank)"
read delimiter
if [ "${delimiter}" = "" ]; then
  delimiter=" "
fi

# set trim track
echo "-----enter trim track:------"
echo "ex)0~4 (0: unset track)"
echo "default) 1"
read trimed_track
if [ "${trimed_track}" = "" ]; then
  trimed_track=1
fi

# set trim name
echo "-----enter trim title start:------"
echo "ex)1~4"
echo "default) 2"
read trimed_title_start
if [ "${trimed_title_start}" = "" ]; then
  trimed_title_start=2
fi

echo "-----enter trim title end:------"
echo "ex)1~4"
echo "default)(none)"
read trimed_title_end

# set extension
echo "enter extension (default "".mp3|.mP3|.Mp3|.MP3""):"
read extension
if [ "${extension}" = "" ]; then
  extension=".mp3|.mP3|.Mp3|.MP3"
fi

# set title and track name
ls -1 ${output}/${created_dir} | grep -E "${extension}" | while IFS="\n" read line
do
  title=`echo ${line} | sed -e "s/^(\ )*//g" -e "s/(${delimiter})*/${delimiter}/g" | cut -d "${delimiter}" -f "${trimed_title_start}-${trimed_title_end}" | awk -F ${extension} '{print $1}'`
  if [ "${trimed_track}" != "0" ]; then
    track=`echo ${line} | sed -e "s/^(\ )*//g" -e "s/(${delimiter})*/${delimiter}/g" | cut -d "${delimiter}" -f "${trimed_track}" | cut -c -2`
  fi

  echo "${line} -> ${track}:${title}"
  filepath=${output}/${created_dir}/${line}
  if [ "${trimed_track}" = "0" ]; then
    mid3v2 -t "${title}" --delete-frames COMM "${filepath}"
  else
    mid3v2 -t "${title}" -T "${track}" --delete-frames COMM "${filepath}"
  fi
done

echo '-----Complete!!-----'
exit 0
