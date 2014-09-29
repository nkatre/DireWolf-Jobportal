jobportal
=========

DireWolf Job Portal helps students find jobs.

<<<<<<<<<<<<<<<<<<-----------URL----------->>>>>>>>>>>>>>
- Project Live On -> http://152.46.16.220:3000
- Project Git Repository Link ->  https://github.ncsu.edu/nkatre/jobportal

<<<<<<<<<<<<<<<<<<-----------USERS----------->>>>>>>>>>>>>>

- Super Admin (This admin cannot be destroyed) 
   Username : admin@admin.com Password : admin

- Other Admins - Few sample admins defined in the system are:
** Username : nkatre@ncsu.edu Password : nkatre **
** Username : gshah@ncsu.edu Password : gshah **

- Employers can be created only by the admins. A sample employer defined in the system is:
** Username : employer@employer.com Password : employer **

- Job Seekers can be created using the sign-up option which appears while login. A sample jobseeker defined in the system is:
** Username : jobseeker@jobseeker.com Password : jobseeker **


<<<<<<<<<<<<<<<<<<----------NAVIGATION------------>>>>>>>>>>>>>>

- 1) HOME -> Redirects to the home-page
- 2) PROFILE -> This button will be inactive for users who are not logged in.
   But for the users who are logged in, it will show the corresponding "Profile" for the relevant type of user.
   Example: ADMIN, EMPLOYER, JOBSEEKER . Clicking on 'Profile' will lists all the jobs that the logged-in user can perform.
- 3) SEARCH -> Search for the jobs on DireWolf. If the search bar is kept empty, it will search for all the jobs and give the result of the search which would be all jobs.
   If some string is entered, it will search for that string in the jobs database and show results relevant to that search.
- 4) LOGIN/LOGOUT -> Redirects to login page and logs out already logged in user.

* The following operations can be performed by each user: *
- 1) Not-logged-in -> Can view all the jobs listed on Direwolf
- 2) Admin(logged-in) ->
        a) Can see his profile by clicking on 'Profile' navigation tab listed on black navigation bar on the web page.
        b) 'Create Job Category' button will allow him/her to create job categories
        c) 'Create Employer' button will allow him/her to create Employers
        d) 'Create Other Admins' will allow him/her to create other Admins
- 3) Employer(logged-in) ->
        a) Can see his profile by clicking on 'Profile' navigation tab listed on black navigation bar on the web page.
        b) 'Create Jobs' button will allow to create any new job
        c)  'View Job Applications' button will allow him/her to view all the job applications to the jobs created by him
- 4) Jobseeker(logged-in) ->
        a) Can see his profile by clicking on 'Profile' navigation tab listed on black navigation bar on the web page.
        b) 'View Jobs' button will view all the job applications (even to the jobs to which he has previously applied). Apply to the job applications by clicking the 'Show' button in Actions.
        c) 'View Recommended Jobs' button will show only those job applications which matches with the tags of the jobs to which he has previously applied, also it excludes all those jobs to which he has previously applied.
            If the job-seeker has not previously applied for any job then the recommended jobs will be empty.


<<<<<<<<<<<<<<<<<<----------LIST OF THINGS TO IMPLEMENT------------>>>>>>>>>>>>>>

- 1) E-mails to be sent, to both the Employers and Job seekers
- 2) Functional Tests - Cucumber Testing
- 3) UI improvements


