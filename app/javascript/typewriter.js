import Typewriter from 'typewriter-effect/dist/core';


document.addEventListener('DOMContentLoaded', function() {
  const typewriterElement = document.querySelector(".typewriter h1");
  const typewriter = new Typewriter(typewriterElement, {
    loop: false,
    delay: 100,
    deleteSpeed: 50,
    cursor: ""
  });

  typewriter
    .pauseFor(100)
    .typeString('AI-DRIVEN')
    .typeString(' CODING')
    .typeString(' CHALLENGES')
    .start();
});
