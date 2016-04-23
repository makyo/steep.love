function switchbg() {
  var bgId = Math.floor(Math.random() * 100) % 4 + 1;
  document.body.style.backgroundImage = 'url(/assets/bg' + bgId + '.jpg)';
}
