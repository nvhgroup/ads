
# Read/write Alternate Data Streams (ADS) in Matlab

Interact with Alternate Data Streams (ADS) on NTFS-files.
\
\
Only tested on Windows.
\
\
Examples:
\
% add "123" to stream "world" in hello.txt, if file missing, it will be created
\
success = tamara.ads.set('hello.txt', 'world', '123')
\
\
% read out value
\
[success, val] = tamara.ads.get('hello.txt', 'world')
\
\
% write more values
\
success = tamara.ads.set('hello.txt', 'test1', 'abc')
\
success = tamara.ads.set('hello.txt', 'test2', 789)
\
\
% read out all streams, except main stream
\
[success, val] = tamara.ads.get('hello.txt', '\*')
\
\
% clear all streams, except main stream
\
success = tamara.ads.clear('hello.txt')
\
[success, val] = tamara.ads.get('hello.txt', '\*')
\
\
License:\
BSD 3-Clause, see LICENSE for details
\
\
Copyright (c) 2023, Wolkesson & Hansson Teknisk Akustik AB. All rights reserved.
\
\
[![View read/write ADS on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://mathworks.com/matlabcentral/fileexchange/124750-read-write-alternate-data-streams-ads)
