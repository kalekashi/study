<!doctype html>
<html>
<head>
  <title>Home</title>
</head>
<body>
  <script>
window.ga=window.ga||function(){(ga.q=ga.q||[]).push(arguments)};ga.l=+new Date;
ga('create', 'UA-74998370-1', 'auto');
ga('require', 'autotrack');
ga('send', 'pageview');


  // Note(philipwalton):
  // Selenium on Windows 10 Edge doesn't handle arrays well, so we fake it.
  var hitData = {count: 0};
  ga('set', 'sendHitTask', function(model) {
    hitData[hitData.count] = {
      page: model.get('page'),
      title: model.get('title'),
      devId: model.get('&did')
    };
    hitData.count++;
  });


  ga('require', 'urlChangeTracker');

  </script>

  <nav>
    <ul>
      <li><a id="foo" href="foo.html">foo.html</a></li>
      <li><a id="bar" href="bar.html">bar.html</a></li>
      <li><a id="qux" href="qux.html">qux.html</a></li>
      <li><a id="replace" href="#">replace</a></li>
      <li><a id="hash" href="#hash">#hash</a></li>
    </ul>
  </nav>

  <p id="content"></p>

  <script>
    var content = document.getElementById('content');

    var foo = document.getElementById('foo');
    var bar = document.getElementById('bar');
    var qux = document.getElementById('qux');
    var replace = document.getElementById('replace');

    foo.addEventListener('click', function(event) {
      event.preventDefault();
      history.pushState({}, 'Foo', 'foo.html');
      fooPage();
    });

    bar.addEventListener('click', function(event) {
      event.preventDefault();
      history.pushState({}, 'Bar', './bar.html');
      barPage();
    });

    qux.addEventListener('click', function(event) {
      event.preventDefault();
      history.pushState({}, 'Qux', this.href);
      quxPage();
    });

    replace.addEventListener('click', function(event) {
      event.preventDefault();
      history.replaceState({}, document.title, location.pathname);
    });

    window.addEventListener('popstate', function(event) {
      if (location.href.indexOf('foo.html') > -1) return fooPage();
      if (location.href.indexOf('bar.html') > -1) return barPage();
      if (location.href.indexOf('qux.html') > -1) return quxPage();
      content.innerHTML = '';
    });

    function fooPage() {
      content.innerHTML = 'Foo';
    }

    function barPage() {
      content.innerHTML = 'Bar';
    }

    function quxPage() {
      content.innerHTML = 'Qux';
    }

  </script>

  <script async src='https://www.google-analytics.com/analytics.js'></script>
  <script async src='/event/js/autotrack.js'></script>

</body>
</html>
