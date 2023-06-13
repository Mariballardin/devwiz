import Typewriter from 'typewriter-effect/dist/core';

function initializeTypewriter() {
  const typewriterElement = document.querySelector(".typewriter h1");
  const typewriter = new Typewriter(typewriterElement, {
    loop: true, // Set loop to true to continuously loop the animation
    delay: 100,
    deleteSpeed: 50,
    autoStart: true,
    cursor: ""
  });

  const languages = ['RUBY', 'PYTHON', 'C++', 'JAVASCRIPT', 'C#', 'PHP', 'GO', 'SWIFT']; // Array of languages

  typewriter
    .pauseFor(100)
    .typeString('AI-DRIVEN')
    .typeString(' CODING')
    .typeString(' CHALLENGES')
    .pauseFor(100);

  // Loop through the languages array
  for (let i = 0; i < languages.length; i++) {
    typewriter
      .typeString(' ' + languages[i])
      .pauseFor(800)
      .deleteChars(languages[i].length);
  }

  typewriter.start();
}

document.addEventListener('DOMContentLoaded', initializeTypewriter);
window.addEventListener('load', initializeTypewriter);
