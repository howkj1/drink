#!/usr/bin/env node
var program = require('commander');
var youtubeRequest = require('./index').youtubeRequest;

program.on('--help', function(){
  console.log('  \n\n Examples:');
  console.log('');
  console.log("    $ drink -y 'https://www.youtube.com/feeds/videos.xml?channel_id=UCfBeRuwRQuYZXUolxVoH0PA'");
  console.log("    $ npm run demo");
  console.log('');
});

 program
  .option('-y, --youtube  <youtube>', 'Youtube chanel')
  .parse(process.argv);

youtubeRequest(program.youtube)
