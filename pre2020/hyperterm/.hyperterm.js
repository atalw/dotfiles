module.exports = {
  config: {
    // default font size in pixels for all tabs
    fontSize: 12,

    // font family with optional fallbacks
    fontFamily: '"Source Code Pro for Powerline", menlo',

    // terminal cursor background color (hex)
    cursorColor: '#F81CE5',

    // color of the text
    foregroundColor: '#fff',

    // terminal background color
    backgroundColor: '#000',

    // border color (window, tabs)
    borderColor: '#333',

    // custom css to embed in the main window
    css: '',

    // custom css to embed in the terminal window
    termCSS: '',

    // custom padding (css format, i.e.: `top right bottom left`)
    padding: '12px 14px',

    // some color overrides. see http://bit.ly/29k1iU2 for
    // the full list
    colors: [
		'#000',
		'#b71c1c', // red
		'#1b5e20', // green
		'#f57f17', // yellow
		'#0d47a1', // blue
		'#c2185b', // pink
		'#006064', // cyan
		'#bdbdbd', // light gray
		'#9e9e9e', // medium gray
		'#b71c1c', // red
		'#1b5e20', // green
		'#f57f17', // yellow
		'#0d47a1', // blue
		'#880e4f', // pink
		'#00acc1', // cyan
		'#fafafa', // white
		'#fff'
    ]
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: [],

  // in development, you can create a directory under
  // `~/.hyperterm_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: []
};
