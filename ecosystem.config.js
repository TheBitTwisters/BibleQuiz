module.exports = {
  apps: [
    {
      name: 'biblequiz-server',
      script: './server/bq-api.js',
      instances: "4",
      exec_mode: "cluster",
      watch: true
    },

  ]
}
