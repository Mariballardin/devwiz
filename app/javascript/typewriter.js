import Typewriter from 'typewriter-effect/dist/core';


document.addEventListener('DOMContentLoaded', function() {
  const typewriterElement = document.querySelector(".typewriter h1");
  const typewriter = new Typewriter(typewriterElement, {
    loop: false,
    delay: 100,
    deleteSpeed: 50
  });

  typewriter
    .pauseFor(1000)
    .typeString('AI-DRIVEN')
    .pauseFor(1000)
    .typeString(' CODING')
    .pauseFor(1000)
    .typeString(' CHALLENGES')
    .pauseFor(1000)
    .start();
});
