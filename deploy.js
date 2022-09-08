// This script will upload the contents of the `dist` folder to web3.storage, so you
// can view the application using an IPFS gateway.
process.env.WEB3STORAGE_TOKEN = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkaWQ6ZXRocjoweDI1Q0M3MmI0MjIyNjEyOTQ0Q0RCZTNGZTE0M0JmMDkxMTE2MTE2MUMiLCJpc3MiOiJ3ZWIzLXN0b3JhZ2UiLCJpYXQiOjE2NjIzNzMzMTI1MzMsIm5hbWUiOiJ3ZWIzZmlsZXMuaW8ifQ.bv1yU7zqTkpxF0vjO7Mo3DVKK6rcd2Uw3xoNXd6TNs8';
//API_TOKEN
const fs = require('fs')
const { Web3Storage, getFilesFromPath } = require('web3.storage')

function die(message) {
  console.error(message)
  process.exit(1)
}

async function deploy() {
  const { WEB3STORAGE_TOKEN } = process.env
  
  const web3Storage = new Web3Storage({ token: WEB3STORAGE_TOKEN })
  console.log('Loading site files...')
  const files = await getFilesFromPath('./dist')
  console.log(`Uploading ${files.length} files to Web3.Storage...`)
  const cid = await web3Storage.put(files, { wrapWithDirectory: false })

var fs = require("fs");

var writeStream = fs.createWriteStream("link.txt");
writeStream.write(`https://${cid}.ipfs.w3s.link/`);
writeStream.end();
  console.log('Deployed to Web3.Storage!')
}

deploy()
  .catch(console.error)
