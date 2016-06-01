/**
 * Check if fonts are preloaded
 * Add a class to the `html` element if they are
 */

function checkFontsPreloaded() {
  if(localStorage.getItem('fontsLoaded')) {
    window.document.documentElement.className += " fonts-loaded";
  }
}

module.exports = checkFontsPreloaded;
