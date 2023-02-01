```sh
 $ ../src/LAUNCH echo foo
 Fatal error: exception Failure("LAUNCH: environment variable TOP *must* be set to use this wrapper")
 Called from unknown location
 [2]
 ```

```sh
 $ env TOP=.. ../src/LAUNCH echo foo
 foo
 ```
