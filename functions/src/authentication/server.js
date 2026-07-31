const express = require('express');
const ytdl = require('@distube/ytdl-core');
const ffmpeg = require('fluent-ffmpeg');
const ffmpegPath = require('@ffmpeg-installer/ffmpeg').path;

ffmpeg.setFfmpegPath(ffmpegPath);

const app = express();

app.get('/download', async (req, res) => {

    const videoURL = req.query.url;

    if (!videoURL) {
        return res.send('No URL provided');
    }

    try {

        const info = await ytdl.getInfo(videoURL);

        const title = info.videoDetails.title.replace(/[^\w\s]/gi, '');

        res.header(
            'Content-Disposition',
            `attachment; filename="${title}.mp3"`
        );

        ffmpeg(ytdl(videoURL, { filter: 'audioonly' }))
            .audioBitrate(128)
            .format('mp3')
            .pipe(res, { end: true });

    } catch (e) {
        console.log(e);
        res.send('Error downloading');
    }
});

app.listen(3000, () => {
    console.log('Server running on port 3000');
});