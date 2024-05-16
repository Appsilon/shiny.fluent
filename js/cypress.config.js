const { defineConfig } = require('cypress')

module.exports = defineConfig({
  projectId: 'pm6grv',
  e2e: {
    setupNodeEvents(on, config) {
      return require('./cypress/plugins/index.js')(on, config)
    },
    defaultCommandTimeout: 10000,
  },
})
