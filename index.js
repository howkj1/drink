var fs = require('fs');
var parseString = require('xml2js').parseString;
var request = require('request');
var i=7;


var parseStringFunction = (error, response, body) => (
  parseString(body, function (err, result) {
      result.feed.entry
       .filter((entry, inc)=> inc < 7)
       .forEach(e => {
        var stream = fs
            .createWriteStream(
                `./output/${e.published[0]}-announcements.markdown`
            )
        stream
            .once('open', ()=>{
                stream.write('---\n')
                stream.write(`title: ${e.title}\n`)
                stream.write(`subtitle: ${e['media:group'][0]['media:description']}\n`)
                stream.write('layout: default\n')
                stream.write(`modal-id: ${i--} \n`)
                stream.write(`date:  ${e.published[0]}\n`)
                stream.write(`img: white_pixel.png\n`)
                stream.write(`thumbnail: http://img.youtube.com/vi/${e['yt:videoId']}/0.jpg\n`)
                stream.write(`alt: ${e['media:group'][0]['media:thumbnail'][0]['$']['url']}\n`)
                stream.write(`project-date: \n`)
                stream.write( `description: <iframe width="560" height="315" src="https://www.youtube.com/embed/${e['yt:videoId']}" frameborder="0" allowfullscreen></iframe> \n`)
                stream.write('---\n')
                stream.end()
            });
      })
  })
);

exports.youtubeRequest = channel => request(
    channel,
    (error, response, body)=>parseStringFunction(error, response,body)
);


// 'https://www.youtube.com/feeds/videos.xml?channel_id=UCfBeRuwRQuYZXUolxVoH0PA',
//  { id: [ 'yt:video:8ESuOlb_iD8' ],
//    'yt:videoId': [ '8ESuOlb_iD8' ],
//    'yt:channelId': [ 'UCfBeRuwRQuYZXUolxVoH0PA' ],
//    title: [ 'Father\'s Day Announcements' ],
//    link: [ { '$': [Object] } ],
//    author: [ { name: [Object], uri: [Object] } ],
//    published: [ '2017-06-18T15:37:57+00:00' ],
//    updated: [ '2017-06-18T16:12:03+00:00' ],
//    'media:group':[
//    { 'media:title': [Object],
//    'media:content': [Object],
//    'media:thumbnail': [Object],
//    'media:description': [Object],
//    'media:community': [Object] } ] }
//  ┌'}]']}
