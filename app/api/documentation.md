Basic authentication usign bcrypt

=> user can registration
=> user can login using phone and password
=>user logout
=>Password reset
=>Change password
=>Confirm password

create User


URL: http://localhost/api/v1/users

Method: POST ⇒ create User

Authorization: Optional

Params:

Name: => string

Email: => string

Password: => string







Example:

{
Name: “ismail”,
Email: “ismail@gmail.com”
Password: 123456
}






Success Response:

Code: 200
Content:
{
"name": "test account",
"email": "mdshalauddin337@gmail.com",
"Ac_status": “inactive”
}

Error Response:


Login



URL: http://localhost/api/v1/users/login

Method: POST ⇒ Login

Authorization: Optional

Params:


Email: => string

Password: => string







Example:

{

Email: “ismail@gmail.com”
Password: 123456
}







Success Response:

Code: 201
Content:


{


"token": "eyJfcmFpbHMiOnsibWVzc2FnZSI6Ik1RPT0iLCJleHAiOiIyMDIzLTA4LTI5VDExOjQzOjEzLjU0NFoiLCJwdXIiOiJ1c2VyL2xvZ2luIn19--1e6b3b835414dbb1f3e88a31cc65f708c9ae2bc6f6f16527a0f7f49824adfe4d",
"status": "inactive"
}




Error Response:




Logout


URL: http://localhost/api/v1/users/logout

Method: GET ⇒ Logout

Authorization: Optional

Params:


Headers 👍

Authorization: “skdjfsajdfskjdkjkjkkjjkkji”







Example:



Success Response:

Code: 200
Content:


{


}



Error Response:




Change password



URL: http://localhost/api/v1/users/change_password

Method: PUT ⇒ Change password

Authorization: Optional

Params:

Old_password:  => string
new_password:  => string
confirm_password:  => string



Headers 👍

Authorization: “skdjfsajdfskjdkjkjkkjjkkji”







Example:



Success Response:

Code: 200
Content:
{


}

Error Response:












Account activation



URL: http://localhost/api/v1/users/account_activation

Method: PUT ⇒ Account activation

Authorization: Optional

Params:


Token:  => string



Example:



Success Response:

Code: 200
Content:

{


"status": "inactive"
}



Error Response:





reconfirm activation



URL: http://localhost/api/v1/users/account_activation

Method: POST ⇒ reconfirm activation

Authorization: Optional

Params:


Token:  => string



Example:



Success Response:

Code: 200
Content:

{


}



Post


All user  post



URL: http://localhost:3000/api/v1/users

Method: GET ⇒ all post

Authorization: requires

Headers 👍

Authorization: “eyJfcmFpbHMiOnsibWVzc2FnZSI6Ik1RPT0iLCJleHAiOiIyMDIzLTA5LTA0VDEwOjMzOjQxLjgxMloiLCJwdXIiOiJ1c2VyL2xvZ2luIn19--caee0db4b7e158ecef25d172b0ba1ed9c8742e65aeb218e3afc478e33647cd84”


Params:





Example:



Success Response:

Code: 200
Content:


[
{
"id": 2,
"title": "Ullam nobis quam ducimus.",
"description": "Et quia tempora. Molestias corporis neque. Possimus temporibus libero.",
"user_id": 1,
"created_at": "2023-09-04T09:59:09.103Z",
"updated_at": "2023-09-04T09:59:09.103Z"
},
{
"id": 10,
"title": "Architecto quibusdam magni sed.",
"description": "Enim dolores nobis. Blanditiis dolor magnam. Cum veniam ad.",
"user_id": 1,
"created_at": "2023-09-04T10:00:02.555Z",
"updated_at": "2023-09-04T10:00:02.555Z"
},
{
"id": 11,
"title": "Incidunt dolorem a quo.",
"description": "Quis distinctio nemo. Accusamus minus sed. Id voluptatum animi.",
"user_id": 1,
"created_at": "2023-09-04T10:00:02.562Z",
"updated_at": "2023-09-04T10:00:02.562Z"
},
{
"id": 14,
"title": "Et facilis dicta dolore.",
"description": "Blanditiis sit fugit. Sunt expedita laborum. Aut ut architecto.",
"user_id": 1,
"created_at": "2023-09-04T10:00:02.587Z",
"updated_at": "2023-09-04T10:00:02.587Z"
}
]


Create post



URL: http://localhost:3000/post/v1/posts

Method: POST ⇒ Create post

Authorization: requires

Params:
title :
description:


Headers 👍

Authorization: “eyJfcmFpbHMiOnsibWVzc2FnZSI6Ik1RPT0iLCJleHAiOiIyMDIzLTA5LTA0VDEwOjMzOjQxLjgxMloiLCJwdXIiOiJ1c2VyL2xvZ2luIn19--caee0db4b7e158ecef25d172b0ba1ed9c8742e65aeb218e3afc478e33647cd84”



Example:



Success Response:

Code: 201
Content:

{
"id": 24,
"title": "this is my dummy post titlefdgdsgsrgsresr"
}




Find  post



URL: http://localhost:3000/post/v1/posts/3

Method: GET ⇒ find post

Authorization: requires




Headers 👍

Authorization: “eyJfcmFpbHMiOnsibWVzc2FnZSI6Ik1RPT0iLCJleHAiOiIyMDIzLTA5LTA0VDEwOjMzOjQxLjgxMloiLCJwdXIiOiJ1c2VyL2xvZ2luIn19--caee0db4b7e158ecef25d172b0ba1ed9c8742e65aeb218e3afc478e33647cd84”



Example:



Success Response:

Code: 201
Content:

{
"title": "this is my edit value",
"description": "this is also edit description",
"user_name": {
"name": "34",
"id": 2
}
}








update  post



URL: http://localhost:3000/post/v1/posts/3

Method: PUT ⇒ update post

Authorization: requires


Params:
title :
description:



Headers 👍

Authorization: “eyJfcmFpbHMiOnsibWVzc2FnZSI6Ik1RPT0iLCJleHAiOiIyMDIzLTA5LTA0VDEwOjMzOjQxLjgxMloiLCJwdXIiOiJ1c2VyL2xvZ2luIn19--caee0db4b7e158ecef25d172b0ba1ed9c8742e65aeb218e3afc478e33647cd84”



Example:



Success Response:

Code: 201
Content:

{
"title": "this is my edit value",
"description": "this is also edit description",
"id": 23,
"user_id": 2,
"created_at": "2023-09-05T12:05:53.353Z",
"updated_at": "2023-09-10T06:09:35.166Z"
}




delete  post



URL: http://localhost:3000/post/v1/posts/3

Method: Delete ⇒ delete post

Authorization: requires


Params:
title :
description:



Headers 👍

Authorization: “eyJfcmFpbHMiOnsibWVzc2FnZSI6Ik1RPT0iLCJleHAiOiIyMDIzLTA5LTA0VDEwOjMzOjQxLjgxMloiLCJwdXIiOiJ1c2VyL2xvZ2luIn19--caee0db4b7e158ecef25d172b0ba1ed9c8742e65aeb218e3afc478e33647cd84”



Example:



Success Response:

Code: 200
Content:

{


}













Comment


Get all comment for any post



URL: http://localhost:3000/comment/v1/comments

Method: GET ⇒ get all comment for any post

Authorization: requires


Params:
post_id:



Headers 👍

Authorization: “eyJfcmFpbHMiOnsibWVzc2FnZSI6Ik1RPT0iLCJleHAiOiIyMDIzLTA5LTA0VDEwOjMzOjQxLjgxMloiLCJwdXIiOiJ1c2VyL2xvZ2luIn19--caee0db4b7e158ecef25d172b0ba1ed9c8742e65aeb218e3afc478e33647cd84”



Example:



Success Response:

Code: 200
Content:

[
{
"id": 2,
"comment": "this is my second commnet to third post",
"user_id": 1,
"post_id": 3,
"created_at": "2023-09-07T06:25:31.660Z",
"updated_at": "2023-09-07T06:25:31.660Z"
}
]








Create a comment in a post



URL: http://localhost:3000/comment/v1/comments

Method: POST ⇒ Create a comment in a post

Authorization: requires


Params:
post_id:
comment:



Headers 👍

Authorization: “eyJfcmFpbHMiOnsibWVzc2FnZSI6Ik1RPT0iLCJleHAiOiIyMDIzLTA5LTA0VDEwOjMzOjQxLjgxMloiLCJwdXIiOiJ1c2VyL2xvZ2luIn19--caee0db4b7e158ecef25d172b0ba1ed9c8742e65aeb218e3afc478e33647cd84”



Example:



Success Response:

Code: 201
Content:

{
"id": 3,
"comment": "this is my second commnet to third post",
"user_id": 1,
"post_id": 23,
"created_at": "2023-09-10T06:23:18.366Z",
"updated_at": "2023-09-10T06:23:18.366Z"
}




Search a comment



URL: http://localhost:3000/comment/v1/comments/1

Method: GET ⇒ Search a comment

Authorization: requires





Headers 👍

Authorization: “eyJfcmFpbHMiOnsibWVzc2FnZSI6Ik1RPT0iLCJleHAiOiIyMDIzLTA5LTA0VDEwOjMzOjQxLjgxMloiLCJwdXIiOiJ1c2VyL2xvZ2luIn19--caee0db4b7e158ecef25d172b0ba1ed9c8742e65aeb218e3afc478e33647cd84”



Example:



Success Response:

Code: 200
Content:

{
"id": 3,
"comment": "this is my second commnet to third post",
"user_id": 1,
"post_id": 23,
"created_at": "2023-09-10T06:23:18.366Z",
"updated_at": "2023-09-10T06:23:18.366Z"
}




delete a comment



URL: http://localhost:3000/comment/v1/comments/1

Method: DELETE ⇒ DELETE a comment

Authorization: requires





Headers 👍

Authorization: “eyJfcmFpbHMiOnsibWVzc2FnZSI6Ik1RPT0iLCJleHAiOiIyMDIzLTA5LTA0VDEwOjMzOjQxLjgxMloiLCJwdXIiOiJ1c2VyL2xvZ2luIn19--caee0db4b7e158ecef25d172b0ba1ed9c8742e65aeb218e3afc478e33647cd84”



Example:



Success Response:

Code: 200
Content:

{


}










Friends


Make a friend request



URL: http://localhost:3000/friend/v1/friends

Method: Post ⇒ Make a friend request

Authorization: requires

Params
request_id:



Headers 👍

Authorization: “eyJfcmFpbHMiOnsibWVzc2FnZSI6Ik1RPT0iLCJleHAiOiIyMDIzLTA5LTA0VDEwOjMzOjQxLjgxMloiLCJwdXIiOiJ1c2VyL2xvZ2luIn19--caee0db4b7e158ecef25d172b0ba1ed9c8742e65aeb218e3afc478e33647cd84”



Example:



Success Response:

Code: 200
Content:

{


}


Accept a friend request



URL: http://localhost:3000/friend/v1/friends

Method: PUT ⇒ Accept a friend request

Authorization: requires

Params
request_id:



Headers 👍

Authorization: “eyJfcmFpbHMiOnsibWVzc2FnZSI6Ik1RPT0iLCJleHAiOiIyMDIzLTA5LTA0VDEwOjMzOjQxLjgxMloiLCJwdXIiOiJ1c2VyL2xvZ2luIn19--caee0db4b7e158ecef25d172b0ba1ed9c8742e65aeb218e3afc478e33647cd84”



Example:



Success Response:

Code: 200
Content:

{


}


