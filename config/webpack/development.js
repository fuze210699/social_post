process.env.NODE_ENV = process.env.NODE_ENV || 'development'

let environment = require('./environment')

environment.loaders.append('vue', {
  test: /\.vue$/,
  use: {
    loader: 'vue-loader'
  }
});

module.exports = environment.toWebpackConfig()
