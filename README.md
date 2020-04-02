# MultichannelAudioCodecBrowserTester
This is a small application for testing browser support of multichannel audio codecs, [check it out](https://thomasdeppisch.github.io/MultichannelAudioCodecBrowserTester/audioCodecTest.html).

Currently we provide wav, opus, vorbis (ogg), m4a (aac), flac and mp3 files containing 1 to 32 channels.<br>
The encoded files were created from the wav files via ffmpeg. If a specific codec/channel combination is not shown but exists as wav, it was not possible to encode it via ffmpeg and the channel layout is probably not supported by the codec.

The test files contain spoken numbers, where each number is assigned to an individual channel. Even channels are sent to the left output and odd channels are sent to the right output to recognize if the channel order is mixed up (as happens sometimes with aac).
