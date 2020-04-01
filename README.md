# MultichannelAudioCodecBrowserTester
Test player for multichannel audio in different codecs, checkout [here](https://thomasdeppisch.github.io/MultichannelAudioCodecBrowserTester/audioCodecTest.html).

This is a small application for testing browser support of multichannel audio files.
Currently we provide wav, opus, vorbis (ogg), m4a (aac), flac and mp3 files containing 1 to 32 channels.
If a specific codec/channel combination is not shown, it was not possible to encode it via ffmpeg and the channel layout is probably not supported by the codec.

The test files contain spoken numbers, where each number is assigned to an individual channel. Even channels are sent to the left output and odd channels are sent to the right output to recognize if the channel order is mixed up. 
