import { join } from 'path';

export default {
  mode: 'production',
  output: {
    path: join(__dirname, '..', 'inst', 'www', 'shiny.fluent'),
    filename: 'shiny-fluent.js',
  },
  resolve: { extensions: ['.js', '.jsx'] },
  module: {
    rules: [
      {
        test: /\.(js|jsx)$/,
        use: ['babel-loader'],
      },
    ],
  },
  externals: {
    '@/shiny.react': 'jsmodule["@/shiny.react"]',
    'prop-types': 'jsmodule["prop-types"]',
    'react': 'jsmodule["react"]',
    'react-dom': 'jsmodule["react-dom"]',
  },
  performance: {
    maxEntrypointSize: 1048576, // 1 MiB
    maxAssetSize: 1048576, // 1 MiB
  },
  stats: { colors: true },
  devtool: 'source-map',
};
