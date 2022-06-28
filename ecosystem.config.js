module.exports = {
  apps: [
    {
      name: 'biblequiz-server',
      cwd: './server/',
      script: 'bq-api.js',
      instances: "4",
      exec_mode: "cluster",
      watch: true
    },

  ]
}
