bottleneck
==========

Bottleneck is a simple and efficient Asynchronous Rate Limiter for Node.JS. When dealing with services with limited resources, it's important to ensure that they don't become overloaded. Bottleneck handles that case in a fast and clean way.


#Install

__Node__
```javascript
npm install bottleneck
```
__Browser__
```html
<script type="text/javascript" src="bottleneck.min.js"></script>
```

#Usage

Most APIs have a rate limit. For example, the Reddit.com API limits programs to 1 request every 2 seconds.

```javascript
var Bottleneck = require("bottleneck"); //Node.JS only

// Wait at least 2000ms between each request.
// Never more than 1 request running at a time.
var limiter = new Bottleneck(1, 2000);
```

```new Bottleneck(maxNb, minTime);```

* maxNb : How many requests can be running at the same time. 0 for unlimited.
* minTime : Optional. How long to wait after launching a request before launching another one.


Instead of doing
```javascript
someAsyncCall(arg1, arg2, argN, callback);
```
You do
```javascript
limiter.submit(someAsyncCall, arg1, arg2, argN, callback);
```
And now you can be assured that someAsyncCall will follow the rate guidelines!

###stopAll
```javascript
limiter.stopAll();
```
Cancels all queued up requests and prevents additonal requests from being submitted.


