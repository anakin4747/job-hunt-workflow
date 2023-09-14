# Job Hunt Workflow

I constantly striving to migrate common workflows to the terminal so that they
can be more portable, allow for automation with bash scripts, and allow easier
integration with Vim.

I used to use Notion for tracking my job applications but after realizing it
was not open source and not available on Linux, I needed a better option.

I have been wanting to learn SQL for quite some time now, so I decided to store
all my applications and their statuses in a SQLite database using bash scripts
to automate the storing. 

I used to have to write my Latex resume and then once I apply I would manually
enter it into notion.

Now I have everything automated with Makefiles and bash scripts so I only enter
the data once.


My workflow starts from the terminal, I run:

    $ make

Which runs the bash script .new-app.sh. This script prompts me to enter in the
application info, then copies a new project from the template for this
application into the working directory. The script then stores the information
of this application in a SQLite database.

Once I have written my resume for that application and applied, I run:

    $ make app

This runs .applied.sh which allows me to select an application in my 'working'
directory then moves that application's project files to the 'applied'
directory and updates the SQLite database to reflect the change in status from
'working' to 'applied'.

If I get a rejection for an application, I run:

    $ make rej

This runs .applied which allows me to select an application in the 'applied'
directory then moves that application's project files to the 'applied/rejected'
directory and updates the SQLite database to reflect the change in status from
'applied' to 'rejected'.


I much prefer this to having a notes app like Notion since it streamlines my
job hunt process by not wasting time with keeping track of applications.


Please let me know your thoughts on this workflow! I wrote this because this is
what I wanted and how I like it; never leaving the terminal. But if you have
comments on how to better interact with a SQLite database or ways I could
improve my bash scripts please let me know! I am always open to learn new
things!
