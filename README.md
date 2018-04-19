# Montage Recorder

This repo contains a small script that I use to record my screen at set
intervals. Currently it only supports Mac OSX.

## Usage

You can configure the following things:

 - *Output folder (o)*: folder to save screenshots to
 - *Start index (i)*: the index from which to begin counting screenshots.
 Files will be named after this index. This setting is useful when resuming
 a recording session.
 - *Time interval (t)*: the amount of time in seconds between each screenshot.
 - *Delay (d)*: an amount of time in seconds to wait before the first screenshot
 is captured.
 - *Force start (y)*: skip prompt to begin recording after the script is
 invoked.

For example, this command will record screenshots every 30 seconds to a folder
called `mymontage` after a 5 second delay:

```
./record.sh -o mymontage -t 30 -d 5
```
