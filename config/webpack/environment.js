const { environment } = require('@rails/webpacker')
const webpack = require('webpack')
environment.plugin.append('Provide',
    new webpack.ProvidePlugin({
        $: 'jquery',
        jQuery: 'jquery',
    })
)
module.exports = environment
