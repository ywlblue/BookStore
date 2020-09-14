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
    $('#edit-customer-form').validate({
        // Specify validation rules
        rules: {
            // The key name on the left side is the name attribute
            // of an input field. Validation rules are defined
            // on the right side
            email: {
                required: true,
                email: true
            },
            firstname: "required",
            lastname: "required",
            password: {
                required: true,
                minlength: 8
            },
            confirm_password: {
                required: true,
                minlength: 8
            },
            phone: "required",
            address_line1: "required",
            city: "required",
            state: "required",
            zip_code: "required"
        },
        // Specify validation error messages
        messages: {
            email: "Please enter a valid email address",
            firstname: "Please enter customer first name",
            lastname: "Please enter customer last name",
            password: {
                required: "Please provide a password",
                minlength: "Your password must be at least 8 characters long"
            },
            confirm_password: {
                required: "Please provide a password",
                minlength: "Your password must be at least 8 characters long"
            },
            phone: "Please enter a phone number",
            address_line1: "Please enter an address",
            city: "Please enter a city",
            state: "Please enter a state",
            zip_code: "please enter a zip code"
        },
        // Make sure the form is submitted to the destination defined
        // in the "action" attribute of the form when valid
        submitHandler: function(form) {
            form.submit();
        }
    });

});