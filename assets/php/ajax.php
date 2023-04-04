<?php

require_once 'functions.php';

if(isset($_GET['follow'])){
    $user_id= $_POST['user_id'];
    if(followUser($user_id)){
        $response['status']=true;
    }
    else{
        $response['status']=false;
    }

    echo json_encode($response);

}

if(isset($_GET['unfollow'])){
    $user_id= $_POST['user_id'];
    if(unfollowUser($user_id)){
        $response['status']=true;
    }
    else{
        $response['status']=false;
    }

    echo json_encode($response);

}

if(isset($_GET['like'])){
    $post_id= $_POST['post_id'];

    if(!checkLikeStatus($post_id)){
        if(like($post_id) ){
            $response['status']=true;
        }
        else{
            $response['status']=false;
        }
    
        echo json_encode($response);
    }
    

}

if(isset($_GET['unlike'])){
    $post_id= $_POST['post_id'];

    if(checkLikeStatus($post_id)){
        if(unlike($post_id) ){
            $response['status']=true;
        }
        else{
            $response['status']=false;
        }
        echo json_encode($response);
    }
}

if(isset($_GET['addcomment'])){
    $post_id= $_POST['post_id'];
    $comment= $_POST['comment'];


        if(addComment($post_id,$comment)){
            $response['status']=true;
        }
        else{
            $response['status']=false;
        }
        echo json_encode($response);
    }
