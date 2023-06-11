// ==UserScript==
// @name         Send To EventGhost
// @namespace    http://tampermonkey.net/
// @version      1.0
// @description  Add a context menu option to send a link to EventGhost or choose your own server
// @author       @Reddit u/The_IMPERIAL_One
// @match        *://*/*
// @run-at       document-start
// @grant        GM_registerMenuCommand
// @grant        GM_xmlhttpRequest
// @icon         https://github.com/EventGhost/EventGhost/raw/master/images/logo.png
// ==/UserScript==

(function() {
    'use strict';

    // Store the link URL
    var linkUrl = null;


    // Function to send the link to EventGhost
    function sendLinkToEventGhost(linkUrl) {
        if (linkUrl) {
            var eventGhostUrl = 'http://localhost:8080/?message=send_to_eventghost=:=' + encodeURIComponent(linkUrl);
            GM_xmlhttpRequest({
                method: 'GET',
                url: eventGhostUrl,
                onload: function(response) {
                    if (response.responseHeaders.includes('EventGhost/0.5.0-rc6')) {
                        console.log('Link sent to EventGhost successfully!');
                    } else {
                        console.error('Failed to send link to EventGhost.');
                    }
                }
            });
        }
    }

    function extractMagnetLink(linkUrl) {
        if (linkUrl) {
            var decodedUrl = decodeURIComponent(linkUrl);
            var magnetRegex = /(magnet:[^\s&]+)/i;
            var match = decodedUrl.match(magnetRegex);

            if (match && match[0]) {
                var magnetLink = match[0];
                console.log(magnetLink);
                sendLinkToEventGhost(magnetLink); // Call sendLinkToEventGhost with the extracted magnet link
            } else {
                console.error('No magnet link found in the URL.');
            }
        }
    }



    addEventListener('mousedown', event => {
        console.log("Context-Menu opened!! Capturing URL...");
        var element = event.target.closest("a");
        if (!element) element = window.location;
        var capturedLinkUrl = element.href;

        console.log("Link URL captured:", capturedLinkUrl);

        setTimeout(() => {
            linkUrl = capturedLinkUrl; // Assign the captured URL to linkUrl
            addMenuCommands(); // Call addMenuCommands with the updated linkUrl
        }, 0);

    });

    setTimeout(addMenuCommands, 0);

    function addMenuCommands() {
        GM_registerMenuCommand('Send as Link', function() {
            sendLinkToEventGhost("link=:=" + linkUrl);
        });

        GM_registerMenuCommand('Send as Magnet Link', function() {
            extractMagnetLink('magnet=:=' + linkUrl);
        });
    }


})();
