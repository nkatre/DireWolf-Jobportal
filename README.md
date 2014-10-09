DireWolf JobPortal
=========

DireWolf JobPortal helps students find jobs.

<<<<<<<<<<<<<<<<<<<<<<--------URL-------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
- Project Live On -> http://152.46.16.220:3000
- Project Git Repository Link ->  https://github.ncsu.edu/nkatre/jobportal

<<<<<<<<<<<<<<<<<<<<--------NOTE---------->>>>>>>>>>>>>>>>>>>>>>>>>>>>
- It is advised that you should use your valid email accounts as username for Admin, Employer and Jobseeker so that
  you can view the emails delivered by this application when the below mentioned events occur

- This application shoots email when the following operations are performed:
    - Admin, Employer, Jobseeker sign-up events
    - Email to employer when job applications are submitted
    - Email to job-seeker on status updates of their job application

- All emails will be sent by the system having default email address:  system.direwolf@gmail.com

- The below mentioned 3 users are system defined and cannot be destroyed. Hence if you want to check the destroy functionality, please create sample users(with valid email address) and destroy them or play with their functionality.
    - Admin: ad.direwolf.min@gmail.com
    - Employer: empl.direwolf.oyer@gmail.com
    - Jobseeker: jobs.direwolf.eeker@gmail.com

- Only Admins can delete Employers created by him/her.

- Only Employers can create and delete the jobs. Admins can neither create jobs nor delete jobs

<<<<<<<<<<<<<<<<<<<<--------USERS---------->>>>>>>>>>>>>>>>>>>>>>>>>>>>

- Super Admin (This admin cannot be destroyed) 
  - Username : ad.direwolf.min@gmail.com Password : adminnkatre (NOTE -> This is a SYSTEM DEFINED admin, it cannot be destroyed)
  - NOTE: Create sample admin with your valid email account(to check emails send by this application)

- Employers can be created only by the admins. A sample employer defined in the system is:
  - Username : empl.direwolf.oyer@gmail.com Password : employernkatre (NOTE -> This is a SYSTEM DEFINED employer, it cannot be destroyed)
  - NOTE: Create sample employer with your valid email account(to check emails send by this application)

- Job Seekers can be created using the sign-up option which appears while login. A sample jobseeker defined in the system is:
  - Username : jobs.direwolf.eeker@gmail.com Password : jobseekernkatre  (NOTE -> This is a SYSTEM DEFINED jobseeker, it cannot be destroyed)
  - NOTE: Create sample jobseeker with your valid email account(to check emails send by this application)
 

<<<<<<<<<<<<<<<<<<<<<<<<<---------NAVIGATION------->>>>>>>>>>>>>>>>>>>>>>>>>>>
- The following active buttons are listed on the navigation bar
    - 1) HOME -> Redirects to the home-page
    - 2) PROFILE -> This button will be inactive for users who are not logged in.
         For logged in users, it will lists all the functions that the logged-in user(admin/employer/jobseeker) can perform.
    - 3) SEARCH -> Search for the jobs on DireWolf. If the search bar is kept empty, by default it will search for all jobs.
         If some string is entered, it will search for the job matching that string.
    - 4) LOGIN/LOGOUT -> This is a toggle button, used for login and logout(of admin/employer/jobseeker)

*********** The following operations can be performed by each user: **********
- 1) Not-logged-in : Can view all the jobs listed on Direwolf
- 2) Admin(logged-in)
 -       a) 'Profile' button given on the black navigation bar enables him/her to see and perform all the actions that an admin can perform.
 -       b) 'Create Job Category' button will allow him/her to create job categories
 -       c) 'Create Employer' button will allow him/her to create Employers
 -       d) 'Create Other Admins' will allow him/her to create other Admins
- 3) Employer(logged-in)
 -       a) 'Profile' button given on the black navigation bar enables him/her to see and perform all the actions that an employer can perform.
 -       b) 'Create Jobs' button will allow to create any new job
 -       c) 'View Job Applications' button will allow him/her to view all the job applications to the jobs created by him
 -       d) 'Change Job Application Status' button will allow him/her to change the status of the job-application submitted by Jobseeker
- 4) Jobseeker(logged-in)
 -       a) 'Profile' button given on the black navigation bar enables him/her to see and perform all the actions that a jobseeker can perform.
 -       b) 'View Jobs' button will view all the jobs created by the employers(also jobs to which he/she has previously applied). Apply to the job applications by clicking the 'Show' button in Actions.
 -       c) 'View Recommended Jobs' button will show only those job applications which matches with the tags of the jobs(Here tag1, tag2, tag3) to which he has previously applied, also it excludes all those jobs to which he has previously applied. If the job-seeker has not previously applied for any job then the recommended jobs will be empty.
 -       d) 'View My Applications' button will only show all the job applications submitted by this jobseeker

- NOTE:
    - a) RECOMMENDED JOBS -> This search is based on the current job applications of the jobseeker. If the jobseeker has not applied to any job OR if the jobseeker
    has deleted the previously applied job, then 'Recommended Jobs' would be NILL. Recommended Jobs is found by matching tags(Here tag1, tag2, and tag3) of the jobs with the previously applied jobs, that the jobseeker applied to.
    - b) SEARCH -> This tool is used to search for jobs. If no string is entered, then by default it will show all the jobs. If some string is entered, then only those jobs would be returned, which have this string
    present either in their job title, tags(Here tag1, tag2, tag3) or category
    - c) Only Admins can delete Employers created by him/her.
    - d) Only Employers can create and delete the jobs. Admins can neither create jobs nor delete jobs
<<<<<<<<<<<<<<<<<<------ BONUS ACTIONS IMPLEMENTED------>>>>>>>>>>>>>>>>>>
-  Email Functionality
-  Cucumber Testing
