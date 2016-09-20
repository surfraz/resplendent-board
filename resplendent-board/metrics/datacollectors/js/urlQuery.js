
// Simple async method for making a HTTP request and updating an object with the response
function simple(method, url, resultItem) {
    var request = null
    request = new XMLHttpRequest()

    request.open(method, url, true)
    request.timeout = 9000

    // request timeout handler
    request.ontimeout = function () {
        console.debug(
                    "simpleQuery Request Timeout: " + "Status: " + request.status + ", Status Text: "
                    + request.statusText + "\n" +
                    ", Response: " + request.responseText + ", url: " + url)
        request.abort()
    }

    // handler for request state change
    request.onreadystatechange = function () {
        // Need to wait for the DONE state or you'll get errors
        if (request.readyState === XMLHttpRequest.DONE) {
            if (request.status === 200) {
                //console.debug("Response = " + request.responseText + ", url: " + url)
                resultItem['data'] = request.responseText
            } else {
                // This is very handy for finding out why your web service won't talk to you
                console.debug(
                            "simpleQuery Request Failed: " + "Status: " + request.status + ", Status Text: "
                            + request.statusText + "\n" +
                            ", Response: " + request.responseText + ", url: " + url)
                request.abort()
            }
        }
    }

    request.setRequestHeader('User-Agent', 'QML XML HTTP Request - SimpleQuery')

    // now go make the request
    request.send()
}
