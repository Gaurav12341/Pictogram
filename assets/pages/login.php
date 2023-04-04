

    <div class="login">
        <div class="col-4 bg-white border rounded p-4 shadow-sm">
            <form method="post" action="assets/php/actions.php?login">
                <div class="d-flex justify-content-center">

                    <img class="mb-4" src="assets/images/pictogram.png" alt="" height="45">
                </div>
                <h1 class="h5 mb-3 fw-normal">Please sign in</h1>

                <div class="form-floating">
                    <input type="text" class="form-control rounded-0" value="<?=showFormData('username_email')?>" name="username_email" placeholder="username/email">
                    <label for="floatingInput">username/email</label>
                </div>
                <?=showError('username_email')?>

                <div class="form-floating mt-1">
                    <input type="password" class="form-control rounded-0" name="password" id="floatingPassword" placeholder="Password">
                    <label for="floatingPassword">password</label>
                </div>
                <?=showError('password')?>
                <?=showError('checkuser')?>

                <div class="mt-3 d-flex justify-content-between align-items-center">
                    <button class="btn btn-primary" type="submit">Sign in</button>
                    <a href="?signup" class="text-decoration-none">Create New Account</a>


                </div>
                <a href="?forgotpassword&newfp" class="text-decoration-none">Forgot password ?</a>
            </form>
        </div>
    </div>

