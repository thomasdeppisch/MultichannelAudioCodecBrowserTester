# MultichannelAudioCodecBrowserTester
This is a small application for testing browser support of multichannel audio codecs, [check it out](https://thomasdeppisch.github.io/MultichannelAudioCodecBrowserTester/audioCodecTest.html).

Currently we provide wav, opus, vorbis (ogg), aac (m4a), flac and mp3 files containing 1 to 32 (or the individual codec maximum number of) channels.<br>
The encoded files were created from the wav files via ffmpeg. If a specific codec/channel combination is not shown but exists as wav, it was not possible to encode it via ffmpeg and the channel layout is probably not supported by the codec.

The test files contain spoken numbers, where each number is assigned to an individual channel. Even channels are sent to the left output and odd channels are sent to the right output to recognize if the channel order is mixed up (as sometimes happens with aac).

Below are some results we obtained in June 2020 and [published in an AES paper](http://www.aes.org/e-lib/browse.cfm?elib=20828).
![Browser Compatibility of Multichannel Audio Codecs](compatibilityTable.png?raw=true "Browser Compatibility of Multichannel Audio Codecs")
