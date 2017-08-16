/* global hljs, Reveal */
"use strict";

function cdn(uri) {
    var proto;

    // Prefer HTTP
    if (window.location.protocol == "https:") {
        proto = "https:";
    } else {
        // Better caching
        proto = "http:";
    }

    return proto + "//cdn.rawgit.com/hakimel/reveal.js/3.5.0/" + uri;
}

function addScript(uri) {
    var script;
    
    script = document.createElement("script");
    script.src = uri;
    document.getElementsByTagName("head")[0].appendChild(script);
}

function addCss(rel) {
    var link;

    link = document.createElement("link");
    link.rel = "stylesheet";
    link.type = "text/css";
    link.href = rel;
    document.getElementsByTagName("head")[0].appendChild(link);
}

function waitForReveal(callback) {
    var startTime;

    function check() {
        // Allow 30 seconds
        if (new Date() - startTime > 30000) {
            console.error("Unable to find Reveal");
        } else if (typeof Reveal !== "undefined") {
            callback();
        } else {
            setTimeout(check, 10);
        }
    }

    startTime = new Date();
    check();
}

addCss(cdn("css/reveal.css"));
addCss(cdn("css/theme/sky.css"));

// Theme for syntax highlighting
addCss(cdn("lib/css/zenburn.css"));

// Printing and PDF exports
if (window.location.search.match(/print-pdf/gi)) {
    addCss(cdn("css/print/pdf.css"));
} else {
    addCss(cdn("css/print/paper.css"));
}

addScript(cdn("lib/js/head.min.js"));
addScript(cdn("js/reveal.js"));
waitForReveal(function () {
    // More info //github.com/hakimel/reveal.js#configuration
    Reveal.initialize({
        history: true,
        // More info //github.com/hakimel/reveal.js#dependencies
        dependencies: [
            {
                src: cdn("plugin/markdown/marked.js")
            },
            {
                src: cdn("plugin/markdown/markdown.js")
            },
            {
                src: cdn("plugin/notes/notes.js"),
                async: true
            },
            {
                src: cdn("plugin/highlight/highlight.js"),
                async: true,
                callback: function () {
                    hljs.initHighlightingOnLoad();
                }
            }
        ]
    });
});
