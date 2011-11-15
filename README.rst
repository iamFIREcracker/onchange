onchange
########

onchange is a simple shell script (written in bash) which enables users to
listen on changes on the current directory and eventually execute commands as
soon as such events are received.


Dependencies
============

The script works both on Linux and FreeBSD systems (I don't have a Mac to test
on it) but has a couple of dependencies:

* ``inotifywait`` on Linux
* ``wait_on`` on FreeBSD

Check whether the right dependency is already installed on your system before
launching the script.


Install
=======

Once you have ``onchange`` script downloaded and placed somewhere handy, you
can call it directly::

    bash /path/of/onchange/onchange.sh ...

or even better, you can create an alias for it::

    alias oc="bash ~/workspace/onchange/onchange.sh"


Examples
========

If you are writing a Latex document, and you want to automatically create the
dvi/pdf output each time you save the source document, you can just run::

    cd /path/of/your/precious/article
    oc gmake

If you want to launch the testsuite of your project each time you edit a file
in order to check if the lastest modifications broke something::

    cd /path/of/your/project
    oc command-to-launch-the-testsuite
