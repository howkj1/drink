var request = require('request');
var parseString = require('xml2js').parseString;
var xml = "<root>Hello xml2js!</root>"
//parseString(xml, function (err, result) {
//    console.dir(result);
//});

request(
    'https://www.youtube.com/feeds/videos.xml?channel_id=UCfBeRuwRQuYZXUolxVoH0PA', 
    function (error, response, body) {
      //console.log('error:', error); // Print the error if one occurred
      //console.log('statusCode:', response && response.statusCode); // Print the response status code if a response was received
      //console.log('body:', body); // Print the HTML for the Google homepage.
        
      parseString(body, function (err, result) {
          result.feed.entry.forEach(e => {
              console.log('---')
              console.log(`title: ${e.title}`)
              console.log(`subtitle: ${e['media:group'][0]['media:description']}`)
              console.log('layout: default')
              console.log(`modal-id: `)
              console.log(`date:  ${e.published[0]}`)
              console.log(`img: white_pixel.png`)
              console.log(`thumbnail: http://img.youtube.com/vi/${e['yt:videoId']}/0.jpg`)
              console.log(`alt: ${e['media:group'][0]['media:thumbnail'][0]['$']['url']}`)
              console.log(`project-date: `)
              console.log(`description: <iframe width="560" height="315" src="https://www.youtube.com/embed/${e['yt:videoId']}" frameborder="0" allowfullscreen></iframe> `)
              console.log('---')
                //  { id: [ 'yt:video:8ESuOlb_iD8' ],
                //    'yt:videoId': [ '8ESuOlb_iD8' ],
                //    'yt:channelId': [ 'UCfBeRuwRQuYZXUolxVoH0PA' ],
                //    title: [ 'Father\'s Day Announcements' ],
        //            link: [ { '$': [Object] } ],
        //            author: [ { name: [Object], uri: [Object] } ],
        //            published: [ '2017-06-18T15:37:57+00:00' ],
        //            updated: [ '2017-06-18T16:12:03+00:00' ],
        //            'media:group':[ 
              //            { 'media:title': [Object],
                //            'media:content': [Object],
                //            'media:thumbnail': [Object],
                //            'media:description': [Object],
                //            'media:community': [Object] } ] }
                //  ┌'}]']}
          })
      });
        
    }
);




