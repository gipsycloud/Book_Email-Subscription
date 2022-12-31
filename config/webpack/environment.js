// const { environment } = require('@rails/webpacker')

// // Add the following lines
// const webpack = require("webpack")

// environment.plugins.append("Provide", new webpack.ProvidePlugin({
//     $: 'jquery',
//     jQuery: 'jquery',
//     Popper: ['popper.js', 'default']  // Not a typo, we're still using popper.js here
// }))
// // End new addition

// module.exports = environment


const { environment } = require('@rails/webpacker')

const webpack = require('webpack')
environment.plugins.append('Provide', new webpack.ProvidePlugin({
  $: 'jquery',
  jQuery: 'jquery',
  Popper: ['popper.js', 'default']
}))

// environment.config.set('resolve.alias', {jquery: 'jquery/src/jquery'});

module.exports = environment