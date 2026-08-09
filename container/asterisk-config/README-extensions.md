# Phase 3C --- `extensions.conf`

`extensions.conf` contains the **Asterisk dialplan configuration** used by the Asterisk VoIP Platform.

It defines **what Asterisk should do when a user dials an extension, including routing calls between internal users and providing test extensions for validating the phone system**.

### Responsibilities

* Define the Asterisk dialplan configuration.
* Create the `internal` dialplan context.
* Define call routing for extension `1001`.
* Define call routing for extension `1002`.
* Route calls to the correct PJSIP endpoint.
* Limit unanswered calls to `30` seconds.
* End calls using the `Hangup()` application.
* Configure extension `600` as an Echo test.
* Configure extension `700` to play the Asterisk `hello-world` audio file.
* Use `NoOp()` entries to provide useful information in the Asterisk console during calls.

### Deliverables

* [ ] The `internal` dialplan context is configured.
* [ ] Extension `1001` can be dialed through `PJSIP/1001`.
* [ ] Extension `1002` can be dialed through `PJSIP/1002`.
* [ ] Internal calls have a `30` second dialing timeout.
* [ ] Calls terminate correctly using `Hangup()`.
* [ ] Extension `600` answers calls and runs the Asterisk Echo test.
* [ ] Extension `700` answers calls and plays the `hello-world` audio file.
* [ ] Dialplan activity can be viewed through the Asterisk console.
* [ ] The dialplan loads successfully without configuration errors.
* [ ] Registered extensions can successfully place internal calls.

### Why `extensions.conf`?

this defines what happens after they dial a number

basically defines what happens after they dial a number

### Why `static=yes` and `writeprotect=yes`?

we want asterisk to only use this dialplan and not have any dynamic modifications while asterisk is running and we want to prevent asterisk from rewriting the extensions.conf from the command line

### Why `NoOp(Call to extension 1001)`?

means no operation this just writes useful info into the asterisk logs , basically for logging purposes, output would look like “Call to extension 1001”, also useful for debugging its also good

### Why `600` and `700`?

this is good for testing purposes 700 proves we can send media to the phone and 600 proves media can travel in both directions


## Phase 3C Completion

Phase 3C is complete when **Asterisk successfully loads the dialplan and registered softphones can dial extensions `1001` and `1002` through the internal context**.

The completed configuration should also provide **extension `600` for testing two-way audio with Echo and extension `700` for confirming that Asterisk can answer a call and play audio successfully**.

