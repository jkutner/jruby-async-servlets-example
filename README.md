## Non-Blocking IO with JRuby Servlets

This project demonstrates how to use non-blocking IO with Servlet 3.1 and JRuby

To try it, clone the app and then run these commands:

```sh-session
$ bundle install
...
Using sinatra 1.4.5
Using warbler 1.4.5
Using bundler 1.7.9
Your bundle is complete!
Use `bundle show [gemname]` to see where a bundled gem is installed.

$ bundle exec warble war
rm -f jruby-servlets.war
Creating jruby-servlets.war

$ java -jar jruby-servlets.war
2015-04-08 09:16:51.018:INFO:oejs.Server:jetty-8.y.z-SNAPSHOT
2015-04-08 09:16:51.056:INFO:oejw.WebInfConfiguration:Extract jar:file:/Users/jkutner/workspace/heroku/kissaten/jruby-servlets/jruby-servlets.war!/ to /private/var/folders/mk/w8gpswvs1tl70bhj60s4kvy40000gn/T/warbler4069300530771564038webroot/jruby-servlets.war/work/jetty-0.0.0.0-8080-jruby-servlets.war-_-any-/webapp
2015-04-08 09:16:52.579:INFO:/:INFO: jruby 1.7.19 (1.9.3p551) 2015-01-30 32f5af0 on Java HotSpot(TM) 64-Bit Server VM 1.8.0_31-b13 +jit [darwin-x86_64]
2015-04-08 09:16:52.582:INFO:/:INFO: using a shared (threadsafe!) runtime
2015-04-08 09:19:10.993:INFO:oejsh.ContextHandler:started
...
2015-04-08 09:19:11.078:INFO:oejs.AbstractConnector:Started SelectChannelConnector@0.0.0.0:8080
```

Then open a browser to `http://localhost:8080`

## Deploying

You can deploy this project to Heroku by installing the Heroku Toolbelt, and running the following commands:

```sh-session
$ heroku create
$ mvn heroku:deploy
```

## Why should I care?

Normal requests block until streaming is done. This example uses Servlet 3.x to
unblock the request thread so that other requests can be handled.
