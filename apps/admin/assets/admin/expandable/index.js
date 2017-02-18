export default function (el, props) {
  el.addEventListener('click', function (e) {
    el.querySelector('li[data-expandable]').classList.toggle('expanded')
  })
}
