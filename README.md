<h1>Website Security Headers Checker</h1>
<p>This script checks a website's HTTP response headers for several security headers that are recommended to be present in order to enhance the security of the website. It then outputs the missing headers, along with a description of the header and how to implement it, to an HTML file, a TXT file, and a PDF file.</p>
<h2>Security Headers and Their Importance</h2>
<p>Security headers are a set of HTTP response headers that can be used to improve the security of a website. These headers help protect against various types of attacks, including cross-site scripting (XSS), clickjacking, and man-in-the-middle attacks. They can also help protect user privacy and prevent information leakage.</p>
<p>Here are some of the most important security headers:</p>
<ul>
<li><strong>X-XSS-Protection:</strong> This header helps protect against cross-site scripting (XSS) attacks. It instructs the browser to block or sanitize any scripts that are detected in the response.</li>
<li><strong>X-Frame-Options:</strong> This header helps protect against clickjacking attacks. It instructs the browser to prevent the website from being displayed in an iframe or similar element on another website.</li>
<li><strong>X-Content-Type-Options:</strong> This header helps protect against MIME sniffing attacks. It instructs the browser to not try to guess the MIME type of the response, but to use the type that is specified in the Content-Type header.</li>
<li><strong>Content-Security-Policy:</strong> This header helps protect against various types of attacks, including XSS and data injection attacks. It allows the website to specify which sources of content are allowed to be loaded or executed, and can prevent scripts, stylesheets, and other content from being loaded from untrusted sources.</li>
<li><strong>Strict-Transport-Security:</strong> This header instructs the browser to only use HTTPS when communicating with the website. This can help prevent man-in-the-middle attacks and other types of attacks that rely on intercepting or modifying network traffic.</li>
<li><strong>Referrer-Policy:</strong> This header controls how much information is included in the Referer header when a user navigates from one website to another. It can help protect user privacy and prevent information leakage.</li>
<li><strong>Permissions-Policy:</strong> This header allows the website to control which browser features and APIs are allowed to be used. It can help prevent various types of attacks and protect user privacy.</li>
</ul>
<h2>How to Use the Script</h2>
<p>Before running the script, make sure that you have the following dependencies installed:</p>
<ul>
<li><a href="https://www.gnu.org/software/wget/">wget</a></li>
<li><a href="https://wkhtmltopdf.org/">wkhtmltopdf</a></li>
</ul>
<p>To run the script, execute the following command:</p>

<pre><code>chmod +x sec-head.sh</code></pre>
<pre><code>sudo ./sec-head.sh</code></pre>

<p>The script will then prompt you to enter the URL of the website that you want to check. After entering the URL, the script will check the website's HTTP response headers for the security headers listed above. If any headers are missing, the script will output the missing headers, along with a description of the header and how to implement it, to an HTML file, a TXT file, and a PDF file.</p>
<h2>Problems Caused by Missing Security Headers</h2>
<p>Missing security headers can leave a website vulnerable to various types of attacks. Here are some of the specific problems that can be caused by missing security headers:</p>

<ul>
<li><strong>X-XSS-Protection:</strong> Without this header, a website can be vulnerable to cross-site scripting (XSS) attacks, which can allow an attacker to inject malicious scripts into the website and steal sensitive user information.</li>
<li><strong>X-Frame-Options:</strong> Without this header, a website can be vulnerable to clickjacking attacks, which can allow an attacker to trick users into clicking on hidden or disguised elements on the website.</li>
<li><strong>X-Content-Type-Options:</strong> Without this header, a website can be vulnerable to MIME sniffing attacks, which can allow an attacker to execute malicious scripts or access sensitive user information.</li>
<li><strong>Content-Security-Policy:</strong> Without this header, a website can be vulnerable to various types of attacks, including XSS and data injection attacks. An attacker can use these types of attacks to execute malicious scripts, steal user information, or modify website content.</li>
<li><strong>Strict-Transport-Security:</strong> Without this header, a website can be vulnerable to man-in-the-middle attacks, which can allow an attacker to intercept or modify network traffic and steal sensitive user information.</li>
<li><strong>Referrer-Policy:</strong> Without this header, a website can be vulnerable to information leakage attacks, which can allow an attacker to gather sensitive user information, such as the user's location or browsing history.</li>
<li><strong>Permissions-Policy:</strong> Without this header, a website can be vulnerable to various types of attacks that rely on browser features and APIs. An attacker can use these features and APIs to execute malicious scripts or access sensitive user information.</li>
</ul>
<h2>Solutions</h2>
<p>If the script detects that a security header is missing from a website, it will output a description of the header and how to implement it. Here are some general tips for implementing security headers:</p>
<ul>
<li><strong>X-XSS-Protection:</strong> Add the header "X-XSS-Protection: 1; mode=block" to the website's HTTP response.</li>
<li><strong>X-Frame-Options:</strong> Add the header "X-Frame-Options: SAMEORIGIN" to the website's HTTP response to prevent the website from being displayed in an iframe or similar element on another website. Alternatively, use the "DENY" or "ALLOW-FROM" options to specify other origins that are allowed to display the website in an iframe.</li>
<li><strong>X-Content-Type-Options:</strong> Add the header "X-Content-Type-Options: nosniff" to the website's HTTP response to prevent the browser from guessing the MIME type of the response.</li>
<li><strong>Content-Security-Policy:</strong> Add the header "Content-Security-Policy" to the website's HTTP response and specify which sources of content are allowed to be loaded or executed. Use the "default-src" directive to specify a default policy, and use other directives, such as "script-src" or "style-src", to specify more specific policies.</li>
<li><strong>Strict-Transport-Security:</strong> Add the header "Strict-Transport-Security" to the website's HTTP response and specify the maximum age for which the browser should only use HTTPS when communicating with the website. Use the "includeSubDomains" option to apply the policy to all subdomains of the website.</li>
<li><strong>Referrer-Policy:</strong> Add the header "Referrer-Policy" to the website's HTTP response and specify how the browser should send the "Referer" header when navigating to other websites. Use the "no-referrer" option to prevent the browser from sending the "Referer" header altogether, or use other options, such as "no-referrer-when-downgrade" or "strict-origin-when-cross-origin", to control how the header is sent.</li>

<li><strong>Permissions-Policy:</strong> Add the header "Permissions-Policy" to the website's HTTP response and specify which browser features and APIs are allowed to be used by the website. Use the "geolocation", "microphone", "camera", "fullscreen", "payment", and other directives to control which features and APIs are allowed or denied.</li>
</ul>
<h2>Conclusion</h2>
<p>The script provided in this repository can help you automate the process of checking for missing security headers on websites and implementing them if necessary. By using security headers, you can significantly reduce the risk of various types of attacks, protect your users' sensitive information, and ensure the integrity of your website's content. We encourage you to use this script and implement security headers on your websites to ensure the best possible security for your users.</p>
