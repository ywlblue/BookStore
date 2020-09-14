$(function() {
    $('#edit-user-form').validate({
        // Specify validation rules
        rules: {
            // The key name on the left side is the name attribute
            // of an input field. Validation rules are defined
            // on the right side
            email: {
                required: true,
                // Specify that email should be validated
                // by the built-in "email" rule
                email: true
            },
            fullname: "required",
            password: {
                required: true,
                minlength: 8
            },
            confirm_password: {
                required: true,
                minlength: 8
            }
        },
        // Specify validation error messages
        messages: {
            email: "Please enter a valid email address",
            fullname: "Please enter user fullname",
            password: {
                required: "Please provide a password",
                minlength: "Your password must be at least 8 characters long"
            },
            confirm_password: {
                required: "Please provide a password",
                minlength: "Your password must be at least 8 characters long"
            }
        },
        // Make sure the form is submitted to the destination defined
        // in the "action" attribute of the form when valid
        submitHandler: function(form) {
            form.submit();
        }
    });

    $('#edit-category-form').validate({
        // Specify validation rules
        rules: {
            category_name: {
                required: true,
            }
        },
        // Specify validation error messages
        messages: {
            category_name: "Please enter a category name"
        },
        // Make sure the form is submitted to the destination defined
        // in the "action" attribute of the form when valid
        submitHandler: function(form) {
            form.submit();
        }
    });
});