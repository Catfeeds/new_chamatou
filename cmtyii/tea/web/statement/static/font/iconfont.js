;(function(window) {

  var svgSprite = '<svg>' +
    '' +
    '<symbol id="icon-shanchu" viewBox="0 0 1024 1024">' +
    '' +
    '<path d="M344.4593 791.382c15.4235 0 27.902-12.4795 27.902-27.902V456.558592c0-15.4225-12.4795-27.902-27.902-27.902-15.4225 0-27.902 12.4805-27.902 27.902v306.92249599999997C316.5573 778.9036 329.0368 791.382 344.4593 791.382zM511.872 791.382c15.4235 0 27.902-12.4795 27.902-27.902V456.558592c0-15.4225-12.4795-27.902-27.902-27.902s-27.902 12.4805-27.902 27.902v306.92249599999997C483.969 778.9036 496.4485 791.382 511.872 791.382zM679.2837 791.382c15.4235 0 27.902-12.4795 27.902-27.902V456.558592c0-15.4225-12.4795-27.902-27.902-27.902s-27.902 12.4805-27.902 27.902v306.92249599999997C651.3818 778.9036 663.8602 791.382 679.2837 791.382zM818.7935 149.6361H703.2340479999999c-12.4795-48.0113-55.8039-83.7059-107.6572-83.7059H428.16512000000006c-51.8533 0-95.1777 35.6946-107.6572 83.7059H204.949504c-61.5526 0-111.6078 50.0828-111.6078 111.6078v27.902976h27.901952v27.901952h55.803904v530.138112c0 61.526 50.0552 111.6078 111.6078 111.6078h446.432256c61.5547 0 111.6078-50.0818 111.6078-111.6078V317.047808h55.803904v-27.901952h27.901952v-27.902976C930.4013 199.7179 880.3482 149.6361 818.7935 149.6361zM428.1651 121.7341h167.411712c20.5445 0 38.3652 11.308 48.0389 27.902H380.12723200000005C389.801 133.0422 407.6206 121.7341 428.1651 121.7341zM790.8915 847.1859c0 30.7896-25.0399 55.8039-55.8039 55.8039H288.65536000000003c-30.763 0-59.6726-25.0143-59.6726-55.8039l3.8687-530.1381h558.040064V847.1859199999999zM149.1446 261.2439c0-30.7896 25.0419-55.8039 55.8039-55.8039H818.793472c30.7651 0 55.8039 25.0143 55.8039 55.8039H149.144576z"  ></path>' +
    '' +
    '</symbol>' +
    '' +
    '<symbol id="icon-bianji" viewBox="0 0 1024 1024">' +
    '' +
    '<path d="M789.705 957.751795 236.576277 957.751795c-50.633191 0-91.826382-41.416272-91.826382-92.322685L144.749895 159.798088c0-50.907437 41.193191-92.322685 91.826382-92.322685l553.128723 0c50.632167 0 91.825358 41.351803 91.825358 92.180446l0 292.122197-61.398372 0L820.131986 159.655848c0-16.97358-13.649881-30.782074-30.426987-30.782074L236.576277 128.873775c-16.778128 0-30.42801 13.872962-30.42801 30.924313l0 705.632045c0 17.051351 13.649881 30.924313 30.42801 30.924313l553.128723 0c16.778128 0 30.426987-13.818727 30.426987-30.803563L820.131986 620.623568l61.398372 0 0 244.927315C881.530358 916.390782 840.337167 957.751795 789.705 957.751795z"  ></path>' +
    '' +
    '<path d="M328.945011 251.670518l368.390231 0 0 30.699186-368.390231 0 0-30.699186Z"  ></path>' +
    '' +
    '<path d="M712.684836 297.719297l-399.089417 0 0-61.398372 399.089417 0L712.684836 297.719297zM344.294604 267.020111l337.691045 0L344.294604 267.020111z"  ></path>' +
    '' +
    '<path d="M328.945011 374.467262l368.390231 0 0 30.699186-368.390231 0 0-30.699186Z"  ></path>' +
    '' +
    '<path d="M712.684836 420.516041l-399.089417 0 0-61.398372 399.089417 0L712.684836 420.516041zM344.294604 389.816855l337.691045 0L344.294604 389.816855z"  ></path>' +
    '' +
    '<path d="M328.945011 497.264006l368.390231 0 0 30.699186-368.390231 0 0-30.699186Z"  ></path>' +
    '' +
    '<path d="M712.684836 543.312785l-399.089417 0 0-61.398372 399.089417 0L712.684836 543.312785zM344.294604 512.613599l337.691045 0L344.294604 512.613599z"  ></path>' +
    '' +
    '<path d="M687.610445 774.920044c-22.799433 5.9e-05-41.945314-16.396985-45.524428-38.989993l-9.749922-61.563208 238.192592-327.843977c8.698064-11.971859 22.672481-19.11856 37.381747-19.11859 9.816284 0.000577 19.254707 3.087397 27.296657 8.930216l49.205633 35.75125c20.669483 15.017258 25.289978 44.023401 10.298209 64.659542l-238.193193 327.844804-61.563208 9.749922C692.524625 774.724869 690.054378 774.919779 687.610445 774.920044zM664.646302 682.124233l7.76148 49.004055c1.200839 7.586422 7.59611 13.092975 15.202818 13.093328 0.840224-0.000477 1.694786-0.067694 2.540137-0.202317l49.004055-7.76148 230.720203-317.555635c5.042016-6.941481 3.469678-16.711572-3.505973-21.779678l-49.207062-35.751023c-2.761781-2.006552-5.961355-3.067567-9.251455-3.067349-4.987552 0.000201-9.560262 2.355961-12.544827 6.463863L664.646302 682.124233z"  ></path>' +
    '' +
    '<path d="M887.981636 405.022433l28.457646 87.590161-29.19672 9.485882-28.457646-87.590161 29.19672-9.485882Z"  ></path>' +
    '' +
    '<path d="M741.867802 713.186921c-12.747363-7.9e-05-23.883023-3.423217-33.302778-10.268335-12.144056-8.823173-20.638351-23.239102-24.563749-41.690786-2.710859-12.739974-2.386511-23.111571-2.339958-24.251554l30.675245 1.236803-15.337623-0.618402 15.339478 0.56536c-0.00267 0.080277-0.239245 8.036489 1.83597 17.345976 1.648471 7.396842 5.155027 17.325055 12.496201 22.61952 8.410481 6.065037 21.700086 5.797547 39.509119-0.793119l10.655216 28.790269C764.110576 710.833252 752.435683 713.187139 741.867802 713.186921z"  ></path>' +
    '' +
    '</symbol>' +
    '' +
    '</svg>'
  var script = function() {
    var scripts = document.getElementsByTagName('script')
    return scripts[scripts.length - 1]
  }()
  var shouldInjectCss = script.getAttribute("data-injectcss")

  /**
   * document ready
   */
  var ready = function(fn) {
    if (document.addEventListener) {
      if (~["complete", "loaded", "interactive"].indexOf(document.readyState)) {
        setTimeout(fn, 0)
      } else {
        var loadFn = function() {
          document.removeEventListener("DOMContentLoaded", loadFn, false)
          fn()
        }
        document.addEventListener("DOMContentLoaded", loadFn, false)
      }
    } else if (document.attachEvent) {
      IEContentLoaded(window, fn)
    }

    function IEContentLoaded(w, fn) {
      var d = w.document,
        done = false,
        // only fire once
        init = function() {
          if (!done) {
            done = true
            fn()
          }
        }
        // polling for no errors
      var polling = function() {
        try {
          // throws errors until after ondocumentready
          d.documentElement.doScroll('left')
        } catch (e) {
          setTimeout(polling, 50)
          return
        }
        // no errors, fire

        init()
      };

      polling()
        // trying to always fire before onload
      d.onreadystatechange = function() {
        if (d.readyState == 'complete') {
          d.onreadystatechange = null
          init()
        }
      }
    }
  }

  /**
   * Insert el before target
   *
   * @param {Element} el
   * @param {Element} target
   */

  var before = function(el, target) {
    target.parentNode.insertBefore(el, target)
  }

  /**
   * Prepend el to target
   *
   * @param {Element} el
   * @param {Element} target
   */

  var prepend = function(el, target) {
    if (target.firstChild) {
      before(el, target.firstChild)
    } else {
      target.appendChild(el)
    }
  }

  function appendSvg() {
    var div, svg

    div = document.createElement('div')
    div.innerHTML = svgSprite
    svgSprite = null
    svg = div.getElementsByTagName('svg')[0]
    if (svg) {
      svg.setAttribute('aria-hidden', 'true')
      svg.style.position = 'absolute'
      svg.style.width = 0
      svg.style.height = 0
      svg.style.overflow = 'hidden'
      prepend(svg, document.body)
    }
  }

  if (shouldInjectCss && !window.__iconfont__svg__cssinject__) {
    window.__iconfont__svg__cssinject__ = true
    try {
      document.write("<style>.svgfont {display: inline-block;width: 1em;height: 1em;fill: currentColor;vertical-align: -0.1em;font-size:16px;}</style>");
    } catch (e) {
      console && console.log(e)
    }
  }

  ready(appendSvg)


})(window)