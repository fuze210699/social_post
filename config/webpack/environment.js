const { environment } = require('@rails/webpacker')
const { VueLoaderPlugin } = require('vue-loader');
const webpack = require('webpack');
const sass = require('sass');

environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin());

environment.loaders.append('vue', {
  test: /\.vue$/,
  use: {
    loader: 'vue-loader'
  }
});

environment.plugins.prepend('Define', new webpack.DefinePlugin({
  '__VUE_OPTIONS_API__': true,
  '__VUE_PROD_DEVTOOLS__': false,
  '__VUE_PROD_HYDRATION_MISMATCH_DETAILS__': false
}));

// Add an alias for Vue to use the ESM version
environment.config.resolve.alias = {
  ...environment.config.resolve.alias,
  'vue': 'vue/dist/vue.esm-bundler.js'
}

// Add support for SCSS files
environment.loaders.prepend('sass', {
  test: /\.scss$/,
  use: [
    {
      loader: 'style-loader', // Adds CSS to the DOM by injecting a `<style>` tag
    },
    {
      loader: 'css-loader', // Interprets `@import` and `url()` like `import/require()` and will resolve them
    },
    {
      loader: 'sass-loader', // Compiles Sass to CSS
      options: {
        implementation: sass,
      },
    },
  ],
});

module.exports = environment