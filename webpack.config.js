const path = require('path');

module.exports = {
  mode: 'production',
  entry: path.join(__dirname, 'srcjs', 'components.js'),
  output: {
    path: path.join(__dirname, 'inst', 'www', 'shiny.fluent'),
    filename: 'components.js',
  },
  module: {
    rules: [
      {
        test: /\.js?$/,
        loader: 'babel-loader',
        options: {
          presets: ['@babel/preset-env'],
        },
      },
      {
        test: /\.css$/i,
        use: ['style-loader', 'css-loader'],
      },
    ],
  },
  externals: {
    // Even though we only use React and ReactDOM indirectly, they must still be listed here
    // so Webpack doesn't bundle a second copy due to the dependencies of the wrapped library.
    'react': 'window.React',
    'react-dom': 'window.ReactDOM',
    'ShinyReact': 'window.ShinyReact',
  },
  performance: {
    maxAssetSize: 4194304, // 4 MiB
    maxEntrypointSize: 4194304, // 4 MiB
  },
  stats: {
    colors: true,
  },
};
