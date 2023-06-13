import ClipboardJS from 'clipboard';

document.addEventListener('turbolinks:load', () => {
  const clipboard = new ClipboardJS('.btn');

  clipboard.on('success', function(e) {
    alert('Conteúdo copiado!');
    e.clearSelection();
  });

  clipboard.on('error', function(e) {
    alert('Erro ao copiar!');
  });
});
