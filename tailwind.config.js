module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  plugins: [require("daisyui")],
  daisyui: {
    darkTheme: false,
    themes: ["pastel"],
  },
  theme: {
    fontFamily: {
      'Darumadrop': ['"Darumadrop One"', 'system-ui'],
    }
  }
}
