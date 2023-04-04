<?php

require_once 'assets/php/functions.php';

if(isset($_SESSION['Auth'])){
    $user=getUser($_SESSION['userdata']['id']);
    $posts=filterPosts();
    $follow_suggestions=filterFollowSuggestions();
}

if(isset($_GET['newfp'])){
    unset($_SESSION['auth_temp']);
    unset($_SESSION['forgot_email']);
    unset($_SESSION['forgot_code']);
}

$pagecount=count($_GET);   //length of params in get request



if(isset($_SESSION['Auth']) && $user['ac_status']==1 && !$pagecount){          //ac_status denotes account status 1=active 0=not active 2=blocked
    showPage('header',['page_title'=>'Pictogram - Home']);       //to set the header title of the website
    showPage('navbar');
    showPage('wall');                                            //to show page
}
else if(isset($_SESSION['Auth']) && $user['ac_status']==0 && !$pagecount){
    showPage('header',['page_title'=>'Pictogram - Verify Your Email']);   
    showPage('verify_email');
}
else if(isset($_SESSION['Auth']) && $user['ac_status']==2 && !$pagecount){
    showPage('header',['page_title'=>'Pictogram - Blocked']); 
    showPage('blocked');
}
else if(isset($_SESSION['Auth']) && isset($_GET['editprofile']) && $user['ac_status']==1){
    showPage('header',['page_title'=>'Edit Profile']);       //to set the header title of the website
    showPage('navbar');
    showPage('edit_profile');
}
else if(isset($_SESSION['Auth']) && isset($_GET['u']) && $user['ac_status']==1){
    $profile= getUserByUsername($_GET['u']);
    
    if(!$profile){
        showPage('header',['page_title'=>'User not Found !']);
        showPage('navbar');
        showPage('user_not_found');
    }else{
        $profile_post=getPostById($profile['id']);
        // if(getFollowers($profile['id'])==null){
        //     $profile['followers']=[];
        // }
        // else{
        //     $profile['followers']=getFollowers($profile['id']);
        // }

        // if(getFollowing($profile['id'])==null){
        //     $profile['following']=[];
        // }
        // else{
        //     $profile['following']=getFollowing($profile['id']);
        // }
        
        $profile['followers']=getFollowers($profile['id']);
        $profile['following']=getFollowing($profile['id']);
        
        showPage('header',['page_title'=>$profile['first_name'].' '.$profile['last_name']]);       //to set the header title of the website
        showPage('navbar');
        showPage('profile');
    }  
}
else if (isset($_GET['signup'])){
    showPage('header',['page_title'=>'Pictogram - Signup']);   //showPage is a function defined in functions.php file
    showPage('signup');
}
else if (isset($_GET['login'])){
    showPage('header',['page_title'=>'Pictogram - Login']);   
    showPage('login');
}
else if (isset($_GET['forgotpassword'])){
    showPage('header',['page_title'=>'Pictogram - Forgot Password']);   
    showPage('forgot_password');
}
else{
    if(isset($_SESSION['Auth']) && $user['ac_status']==1){
        showPage('header',['page_title'=>'Pictogram - Home']);       //to set the header title of the website
        showPage('navbar');
        showPage('wall');
    }
    
    else if(isset($_SESSION['Auth']) && $user['ac_status']==0 ){
        showPage('header',['page_title'=>'Pictogram - Verify Your Email']);   
        showPage('verify_email');
    }
    else if(isset($_SESSION['Auth']) && $user['ac_status']==2 ){
        showPage('header',['page_title'=>'Pictogram - Blocked']); 
        showPage('blocked');
    }
    else{
        showPage('header',['page_title'=>'Pictogram - Login']);   
        showPage('login');
    }
}


showPage('footer');
unset($_SESSION['error']);
unset($_SESSION['formdata']);