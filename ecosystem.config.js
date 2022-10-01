module.exports = {
  apps: [
    {
      name: 'biblequiz-server',
      cwd: './server/',
      script: 'bq-api.js',
      instances: '8',
      exec_mode: 'cluster',
      watch: true
    },
    {
      name: 'biblequiz-player',
      cwd: './player',
      script: 'npm',
      args: 'start',
      watch: true,
      instances: '2',
      exec_mode: 'cluster'
    },
    {
      name: 'biblequiz-manager',
      cwd: './manager',
      script: 'npm',
      args: 'start',
      watch: true,
      instances: '2',
      exec_mode: 'cluster'
    }
  ]
}
