// Entry point for the build script in your package.json

import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"
import "./typewriter.js"


new Typewriter('#typewriter', {
  strings: ['Hello', 'World'],
  autoStart: true,
});
