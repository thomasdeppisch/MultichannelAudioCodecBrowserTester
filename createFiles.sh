#!/bin/sh

# create multichannel files for different codecs, using 64kbps per channel
# Thomas Deppisch, 2020

outdir='./audio/'
mkdir $outdir

for numChannels in 1 2 3 4 5 6 7 8 9 10 16 24 25 31 32
do
    echo 'current number of channels: '$numChannels
    bitrate=$((numChannels * 64))

    echo '\n OPUS \n'
    ffmpeg \
        -i './audio/'$numChannels'.wav' \
        -n -ac $numChannels -c:a libopus -mapping_family 255 -b:a $bitrate'k' -vn $outdir'/'$numChannels'.opus'

    # echo '\n OPUS in WebM \n'
    # ffmpeg \
    #     -i './audio/'$numChannels'.wav' \
    #     -n -ac $numChannels -c:a libopus -mapping_family 255 -b:a $bitrate'k' -vn -f webm -dash 1 $outdir'/'$numChannels'.opus'

    echo '\n AAC \n'
    ffmpeg \
        -i './audio/'$numChannels'.wav' \
        -n -ac $numChannels -c:a libfdk_aac -profile:a 'aac_low' -b:a $bitrate'k' -vn $outdir'/'$numChannels'.m4a'

    # echo '\n HE-AAC \n'
    # ffmpeg \
    #     -i './audio/'$numChannels'.wav' \
    #     -n -ac $numChannels -c:a libfdk_aac -profile:a 'aac_he' -b:a $bitrate'k' -vn $outdir'/'$numChannels'_he.m4a'

    # echo '\n HE-AAC v2 \n'
    # ffmpeg \
    #     -i './audio/'$numChannels'.wav' \
    #     -n -ac $numChannels -c:a libfdk_aac -profile:a 'aac_he_v2' -b:a $bitrate'k' -vn $outdir'/'$numChannels'_he2.m4a'

    echo '\n MP3 \n'
    ffmpeg \
        -i './audio/'$numChannels'.wav' \
        -n -ac $numChannels -c:a libmp3lame -b:a $bitrate'k' -vn $outdir'/'$numChannels'.mp3'

    echo '\n VORBIS \n'
    ffmpeg \
        -i './audio/'$numChannels'.wav' \
        -n -ac $numChannels -c:a libvorbis -b:a $bitrate'k' -vn $outdir'/'$numChannels'.ogg'

    echo '\n FLAC \n'
    ffmpeg \
        -i './audio/'$numChannels'.wav' \
        -n -ac $numChannels -c:a flac -ch_mode 'indep' -b:a $bitrate'k' -vn $outdir'/'$numChannels'.flac'

done
exit 0